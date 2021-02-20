constant DocRoot = "https://harfbuzz-raku.github.io";

multi sub resolve-class(@path ( 'HarfBuzz', 'Subset', *@)) { %( :repo<HarfBuzz-Subset-raku>, :@path ) }
multi sub resolve-class(@ ( 'HarfBuzz', 'Shaper', 'Cairo', *@)) { %( :repo<HarfBuzz-Shaper-Cairo-raku> ) }
multi sub resolve-class(@ ( 'HarfBuzz', 'Font', 'FreeType', *@)) { %( :repo<HarfBuzz-Font-FreeType-raku> ) }
multi sub resolve-class(@path ( 'Font', 'FreeType', *@)) { %( :repo<Font-FreeType-raku>, :@path, :doc<https://pdf-raku.github.io> ) }
multi sub resolve-class(@ ( 'HarfBuzz', *@path)) { %( :repo<HarfBuzz-raku>, :@path ) }
multi sub resolve-class(@p) { fail "unable to resolve class @p[]" }

sub link-to-url(Str() $class-name) {
    my %info = resolve-class($class-name.split('::'));
    my @path = %info<doc> // DocRoot;
    @path.push: %info<repo>;
    @path.append(.list) with %info<path>;
    @path.join: '/';
}

sub breadcrumb(Str $url is copy, @path, UInt $n = +@path, :$top) {
    my $name = $top ?? @path[0 ..^ $n].join('::') !! @path[$n-1];
    $url ~= '/' ~ @path[0..^ $n].join('/');
    my $sep = $top ?? '/' !! '::';
    say " $sep [$name]($url)";
}

INIT {
    with %*ENV<TRAIL> {
        # build a simple breadcrumb trail
        my $url = DocRoot;
        say "[[Raku HarfBuzz Project]]({$url})";
        my %info = resolve-class(.split('/'));
        my $repo = %info<repo>;
        $url ~= '/' ~ $repo;

        my @mod = $repo.split('-');
        @mod.pop if @mod.tail ~~ 'raku';
        my $mod = @mod.join: '-';
        say " / [[$mod Module]]({$url})";

        with %info<path> {
            my @path = .list;
            my $n = @path[0..^+@mod] == @mod ?? +@mod !! 2;
            breadcrumb($url, @path, $n, :top);
            breadcrumb($url, @path, $_)
                for $n ^.. @path;
        }
        say '';
    }
}

s:g:s/ '](' ([HarfBuzz|Font]['::'*%%<[a..z A..Z 0..9 _ -]>+]) ')'/{'](' ~ link-to-url($0) ~ ')'}/;

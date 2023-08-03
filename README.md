# harfbuzz-raku.github.io

## Description
The `harfbuzz-raku` project is focused on Raku binding to the HarfBuzz
library and its functionality. In particular

- Text Shaping - The selection and positioning of glyphs to display text
- Font Subsetting - Reduction of a font to the set of used glyphs, e.g. for embedding in a PDF or for use as a web-page font.

At this stage, it is recommended that the HarfBuzz library is built from source, to get an up-to-date version that includes the HarfBuzz font subsetting library.

## Installation

On Debian 12+:

```
$ cat /etc/debian_version # 12.0 or better
$ sudo apt install libharfbuzz-dev
```

harfbuzz 3.0 is required. On other platforms, the library may need
to be built from source:
```
wget -q https://github.com/harfbuzz/harfbuzz/archive/8.1.1.tar.gz
tar xvzf 8.1.1.tar.gz
cd harfbuzz-8.1.1
./autogen.sh
make
sudo make install
sudo ldconfig
```

The various HarfBuzz Raku modules can then be installed, using an appropriate module manager, such as `zef`. For example:

```
zef install HarfBuzz::Subset
```

## Modules

### [HarfBuzz](https://harfbuzz-raku.github.io/HarfBuzz-raku/)
Base HarfBuzz bindings. This distribution includes [HarfBuzz::Shaper](https://harfbuzz-raku.github.io/HarfBuzz-raku/HarfBuzz/Shaper), which
may be enough to perform basic shaping.

### [HarfBuzz::Font::FreeType](https://harfbuzz-raku.github.io/HarfBuzz-Font-FreeType-raku/)
FreeType integration (via the Raku [Font::FreeType](https://pdf-raku.github.io/Font-FreeType-raku/) module.

Note that HarfBuzz can load OpenType and TrueType format fonts directly. The FreeType integration most likely to be useful for
other font formats, that can be loaded by [Font::FreeType](https://harfbuzz-raku.github.io/Font-FreeType-raku/).

### [HarfBuzz::Shaper::Cairo](https://harfbuzz-raku.github.io/HarfBuzz-Shaper-Cairo-raku)
HarfBuzz/Cairo integration for glyph positioning and display.

### [HarfBuzz::Subset](https://harfbuzz-raku.github.io/HarfBuzz-Subset-raku)
Binding to HarfBuzz's font-subsetting capabilities.



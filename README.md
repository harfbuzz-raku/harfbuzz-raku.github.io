# harfbuzz-raku.github.io

## Description
The `harfbuzz-raku` project is focused on Raku binding to the HarfBuzz
library and its functionality. In particular

- Text Shaping - The selection and positioning of glyphs to display text
- Font Subsetting - Reduction of a font to the set of used glyphs, e.g. for embedding in a PDF or for use as a web-page font.

At this stage, it is recommended that the HarfBuzz library is built from source, to get an up-to-date version that includes the HarfBuzz font subsetting library.

## Installation
```
tar xvzf 2.7.4.tar.gz
cd harfbuzz-2.7.4
./autogen.sh
make
sudo make install
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

Note that HarfBuzz can load OpenType and TrueType formatted fonts directly. The FreeType integration most likely to be useful for
other formats, that can be loaded by [Font::FreeType](https://harfbuzz-raku.github.io/Font-FreeType-raku/).

### [HarfBuzz::Shaper::Cairo](https://harfbuzz-raku.github.io/HarfBuzz-Shaper-Cairo-raku)
HarfBuzz/Cairo integration for glyph positioning and display.

### [HarfBuzz::Subset](https://harfbuzz-raku.github.io/HarfBuzz-Subset-raku)
Binding to HarfBuzz's font-subsetting capabilities.



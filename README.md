# mdss (Markdown Static Sites)
## Who knew static sites could be so easy?

MDSS (or mdss, because really, who cares) is a Ruby gem designed to ease the development and maintenance of locally designed static sites. Too often, at least for me, static site generators aren't intuitive to use, aren't focused for simple static sites (not blogs), or most often don't support GitHub flavoured Markdown (GFM). 

MDSS is different in that it is a tool written by me, for me. However, it may be useful for you if you want a simple static site with GFM. In fact, the ideal workflow with MDSS is:

1. Create a site with `mdss --init <NAME>`
2. Write website stuff (Markdown, CSS (SASS?), and JS)
3. Compile and upload to your server with `mdss --launch`

Simple, eh?

### Installation

**NOTE:** MDSS is still is pre-alpha. Don't have high expectations, or really any expectations at all.

```bash
# SIMPLE INSTALLATION
gem install mdss
```

### Usage

```bash
# SIMPLE USAGE
Usage: mdss [options]
    -i, --init site                  Create a new simple static site with GFM
    -h, --help                       Display help menu
    -l, --launch                     Compile and upload to the big wide world
```


<!-- README.md is generated from README.Rmd. Please edit that file -->

# shortuuid

<!-- badges: start -->
<!-- badges: end -->

The goal of shortuuid is to generate and translate standard UUIDs into
shorter - or just different - formats and back. Inspired by
[short-uuid](https://www.npmjs.com/package/short-uuid) and
[fosstodon](https://fosstodon.org/@josi/112978240064605859)

## Installation

You can install the development version of shortuuid like so:

``` r
remotes::install_github("schochastics/shortuuid")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(shortuuid)
# generate random uuids
id <- generate_uuid()
id
#> d795c693-b697-48f6-823d-e74aba11ba87
```

``` r
is.uuid(id)
#> [1] TRUE
```

``` r
# alphabet: "123456789ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnopqrstuvwxyz"
uuid_to_bitcoin58(id)
#> [1] "Td3GGm7CQqAnv2S8kdDaRt"
```

``` r
# alphabet: "123456789abcdefghijkmnopqrstuvwxyzABCDEFGHJKLMNPQRSTUVWXYZ"
uuid_to_flickr58(id)
#> [1] "sC3ggL7cpQaMV2r8KCdzqT"
```

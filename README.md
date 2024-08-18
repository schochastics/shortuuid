
<!-- README.md is generated from README.Rmd. Please edit that file -->

# shortuuid

<!-- badges: start -->
<!-- badges: end -->

The goal of shortuuid is to generate and translate standard UUIDs into
shorter - or just different - formats and back. Inspired by
[short-uuid](https://www.npmjs.com/package/short-uuid) and a post on
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
#> a5310703-2192-40c5-b80e-8014acf7794f
```

``` r
is.uuid(id)
#> [1] TRUE
```

``` r
# alphabet: "123456789ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnopqrstuvwxyz"
uuid_to_bitcoin58(id)
#> [1] "MQ7jLZrnNjrDTXeSimRk2i"
```

``` r
# alphabet: "123456789abcdefghijkmnopqrstuvwxyzABCDEFGHJKLMNPQRSTUVWXYZ"
uuid_to_flickr58(id)
#> [1] "mp7JkyRMnJRdswDrHLqK2H"
```

## Addendum

Code to generate uuids taken from
[@rkg8](https://github.com/rkg82/uuid-v4)

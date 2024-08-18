
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
#> a2a5a9dd-8b41-4d7d-b04a-6841d066bc18
```

``` r
is.uuid(id)
#> [1] TRUE
```

``` r
# alphabet: "123456789ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnopqrstuvwxyz"
b58 <- uuid_to_bitcoin58(id)
b58
#> [1] "M5tngZoKGoK7zMLo6SHVm1"
```

``` r
# alphabet: "123456789abcdefghijkmnopqrstuvwxyzABCDEFGHJKLMNPQRSTUVWXYZ"
f58 <- uuid_to_flickr58(id)
f58
#> [1] "m5TMFyNjgNj7ZmkN6rhuL1"
```

``` r
# convert back
bitcoin58_to_uuid(b58)
#> [1] "a2a5a9dd-8b41-4d7d-b04a-6841d066bc18"
```

``` r
flickr58_to_uuid(f58)
#> [1] "a2a5a9dd-8b41-4d7d-b04a-6841d066bc18"
```

## Addendum

Code to generate uuids taken from
[@rkg8](https://github.com/rkg82/uuid-v4)

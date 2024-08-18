
<!-- README.md is generated from README.Rmd. Please edit that file -->

# shortuuid

<!-- badges: start -->

[![R-CMD-check](https://github.com/schochastics/shortuuid/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/schochastics/shortuuid/actions/workflows/R-CMD-check.yaml)
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
#> [1] "310ca046-a3ca-4d84-a430-71c817e3ceed"
```

``` r
is.uuid(id)
#> [1] TRUE
```

``` r
# alphabet: "123456789ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnopqrstuvwxyz"
b58 <- uuid_to_bitcoin58(id)
b58
#> [1] "74J97TSP7czk2d9NbSnxK6"
```

``` r
# alphabet: "123456789abcdefghijkmnopqrstuvwxyzABCDEFGHJKLMNPQRSTUVWXYZ"
f58 <- uuid_to_flickr58(id)
f58
#> [1] "74i97sro7BZK2C9nArMXj6"
```

``` r
# convert back
bitcoin58_to_uuid(b58)
#> [1] "310ca046-a3ca-4d84-a430-71c817e3ceed"
```

``` r
flickr58_to_uuid(f58)
#> [1] "310ca046-a3ca-4d84-a430-71c817e3ceed"
```

## Addendum

Code to generate uuids taken from
[@rkg8](https://github.com/rkg82/uuid-v4)


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
ids <- generate_uuid(n = 5)
ids
#> [1] "3feb61b6-fa7d-4916-aa96-66b592eaeba3" "37720bce-e10c-4728-8464-768f643c15ce"
#> [3] "02261e5b-337a-4c3f-8536-09dff9083647" "293e7339-df06-4ea1-bf4b-6e2083951f45"
#> [5] "b4cc99b5-3a0f-4df2-aa4b-6e1026a6232e"
```

``` r
is.uuid(ids)
#> [1] TRUE TRUE TRUE TRUE TRUE
```

``` r
# alphabet: "123456789ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnopqrstuvwxyz"
b58 <- uuid_to_bitcoin58(ids)
b58
#> [1] "8toDGGQNM3YM5TaXV9vi3c" "7r77kxEjv6Lgmd7w7XHd1X" "GPf2YcccszxNF162K9hG2" 
#> [4] "66PnAynkuRJh3Q1UQgQANQ" "PKuBug1DrwQTTnSEowKxyK"
```

``` r
# alphabet: "123456789abcdefghijkmnopqrstuvwxyzABCDEFGHJKLMNPQRSTUVWXYZ"
f58 <- uuid_to_flickr58(ids)
f58
#> [1] "8TNdggpnm3xm5szwu9VH3B" "7R77KXeJV6kFLC7W7whC1w" "goE2xBBBSZXnf162j9Gg2" 
#> [4] "66oMaYMKUqiG3p1tpFpanp" "ojUbUF1dRWpssMreNWjXYj"
```

``` r
# convert back
bitcoin58_to_uuid(b58)
#> Warning: NAs introduced by coercion
#> [1] "3feb61b6-fa7d-4916-aa96-66b592eaeba3" "37720bce-e10c-4728-8464-768f643c15ce"
#> [3] NA                                     "293e7339-df06-4ea1-bf4b-6e2083951f45"
#> [5] "b4cc99b5-3a0f-4df2-aa4b-6e1026a6232e"
```

``` r
flickr58_to_uuid(f58)
#> Warning: NAs introduced by coercion
#> [1] "3feb61b6-fa7d-4916-aa96-66b592eaeba3" "37720bce-e10c-4728-8464-768f643c15ce"
#> [3] NA                                     "293e7339-df06-4ea1-bf4b-6e2083951f45"
#> [5] "b4cc99b5-3a0f-4df2-aa4b-6e1026a6232e"
```

## Addendum

Code to generate uuids taken from
[@rkg8](https://github.com/rkg82/uuid-v4)

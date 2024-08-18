
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
#> [1] "c04962f3-4339-43f9-bc3b-67a8d0998dd5" "58419695-bf31-4646-ab11-57cea8205ce7"
#> [3] "d23c39d2-0a33-42e8-98ec-95db316a0dfa" "60eee1ea-3955-4193-a380-1ab9221b5b64"
#> [5] "02a5fdde-54f7-4606-9f8e-62b5a11e1820"
```

``` r
is.uuid(ids)
#> [1] TRUE TRUE TRUE TRUE TRUE
```

``` r
# alphabet: "123456789ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnopqrstuvwxyz"
b58 <- uuid_to_bitcoin58(ids)
b58
#> [1] "QkB5wfVZDKD3QgUQypVfz4" "Bu6iorG3EcZA1V6sVjntW2" "Sxix3ZA6A9xAu1s53RAueZ"
#> [4] "CyF8NNrkmCNbK5VctN4hQf" "Ky9iQGeujq1XQ1DQ7cNE3"
```

``` r
# alphabet: "123456789abcdefghijkmnopqrstuvwxyzABCDEFGHJKLMNPQRSTUVWXYZ"
f58 <- uuid_to_flickr58(ids)
f58
#> [1] "pKb5WEuydjd3pFtpYPuEZ4" "bU6HNRg3eBya1u6SuJMTv2" "rXHX3ya6a9XaU1S53qaUDy"
#> [4] "cYf8nnRKLcnAj5uBTn4GpE" "jY9HpgDUJQ1wp1dp7Bne3"
```

``` r
# convert back
bitcoin58_to_uuid(b58)
#> Warning: NAs introduced by coercion
#> [1] "c04962f3-4339-43f9-bc3b-67a8d0998dd5" "58419695-bf31-4646-ab11-57cea8205ce7"
#> [3] "d23c39d2-0a33-42e8-98ec-95db316a0dfa" "60eee1ea-3955-4193-a380-1ab9221b5b64"
#> [5] NA
```

``` r
flickr58_to_uuid(f58)
#> Warning: NAs introduced by coercion
#> [1] "c04962f3-4339-43f9-bc3b-67a8d0998dd5" "58419695-bf31-4646-ab11-57cea8205ce7"
#> [3] "d23c39d2-0a33-42e8-98ec-95db316a0dfa" "60eee1ea-3955-4193-a380-1ab9221b5b64"
#> [5] NA
```

## Addendum

Code to generate uuids taken from
[@rkg8](https://github.com/rkg82/uuid-v4)

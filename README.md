
<!-- README.md is generated from README.Rmd. Please edit that file -->

# shortuuid <img src="man/figures/logo.png" align="right" height="139" alt="" />

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
#> [1] "bcebf5e3-2ee8-46f4-a31a-a92392218067"
#> [2] "672311ef-ffb7-4ccf-9d32-43ea69366b59"
#> [3] "ba041d3b-2b5f-4973-843a-5af11d3e0d83"
#> [4] "33a2c8b1-af02-41bf-bf00-1de387bfa160"
#> [5] "83f32d4a-dee1-4f37-b9e1-2fbf4263af71"
```

``` r
is.uuid(ids)
#> [1] TRUE TRUE TRUE TRUE TRUE
```

``` r
# alphabet: "123456789ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnopqrstuvwxyz"
b58 <- uuid_to_bitcoin58(ids)
b58
#> [1] "QL5HS5bUkCksVHSdZRARxi" "DjgDY7cqTkMb4QeC2bbAHe" "PyGGrbPiqaQJZ3wkuZ3dbp"
#> [4] "7Npbe4WM8YKcSuz9YXCmWf" "HJ38h8nL729Sg9YpoFcbUt"
```

``` r
# alphabet: "123456789abcdefghijkmnopqrstuvwxyzABCDEFGHJKLMNPQRSTUVWXYZ"
f58 <- uuid_to_flickr58(ids)
f58
#> [1] "pk5hr5AtKcKSuhrCyqaqXH" "dJFdx7BQsKmA4pDc2AAahD" "oYggRAoHQzpiy3WKUy3CAP"
#> [4] "7nPAD4vm8xjBrUZ9xwcLvE" "hi38G8Mk729rF9xPNfBAtT"
```

``` r
# convert back
bitcoin58_to_uuid(b58)
#> [1] "bcebf5e3-2ee8-46f4-a31a-a92392218067"
#> [2] "672311ef-ffb7-4ccf-9d32-43ea69366b59"
#> [3] "ba041d3b-2b5f-4973-843a-5af11d3e0d83"
#> [4] "33a2c8b1-af02-41bf-bf00-1de387bfa160"
#> [5] "83f32d4a-dee1-4f37-b9e1-2fbf4263af71"
```

``` r
flickr58_to_uuid(f58)
#> [1] "bcebf5e3-2ee8-46f4-a31a-a92392218067"
#> [2] "672311ef-ffb7-4ccf-9d32-43ea69366b59"
#> [3] "ba041d3b-2b5f-4973-843a-5af11d3e0d83"
#> [4] "33a2c8b1-af02-41bf-bf00-1de387bfa160"
#> [5] "83f32d4a-dee1-4f37-b9e1-2fbf4263af71"
```

## Addendum

Code to generate uuids taken from
[@rkg8](https://github.com/rkg82/uuid-v4)

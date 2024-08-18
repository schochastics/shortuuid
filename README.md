
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
#> [1] "8f402757-a10d-447f-9601-656a7b9063cd"
#> [2] "f99091f8-dabf-4b91-9c6e-978156f9ad56"
#> [3] "21d82b56-09b2-4389-a90f-90850988c56a"
#> [4] "5db66b61-46a3-4eda-a23e-38f6f067a111"
#> [5] "95b67b20-440d-4813-af8b-4e6c10c21491"
```

``` r
is.uuid(ids)
#> [1] TRUE TRUE TRUE TRUE TRUE
```

``` r
# alphabet: "123456789ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnopqrstuvwxyz"
b58 <- uuid_to_bitcoin58(ids)
b58
#> [1] "JgyTBcoJBQjxxrGEWBFjUQ" "XpQTFjwKod2cdsJLDUYw7T" "5BQ1Fg2SM5ajD1LJavHJuF"
#> [4] "CaBJc7dVNnXYc1EcXh7U4g" "KVFs3SAEFKwqV74HT8gAEL"
```

``` r
# alphabet: "123456789abcdefghijkmnopqrstuvwxyzABCDEFGHJKLMNPQRSTUVWXYZ"
f58 <- uuid_to_flickr58(ids)
f58
#> [1] "iFYsbBNibpJXXRgevbfJtp" "wPpsfJWjNC2BCSikdtxW7s" "5bp1fF2rm5zJd1kizVhiUf"
#> [4] "czbiB7CunMwxB1eBwG7t4F" "jufS3raefjWQu74hs8Faek"
```

``` r
# convert back
bitcoin58_to_uuid(b58)
#> [1] "8f402757-a10d-447f-9601-656a7b9063cd"
#> [2] "f99091f8-dabf-4b91-9c6e-978156f9ad56"
#> [3] "21d82b56-09b2-4389-a90f-90850988c56a"
#> [4] "5db66b61-46a3-4eda-a23e-38f6f067a111"
#> [5] "95b67b20-440d-4813-af8b-4e6c10c21491"
```

``` r
flickr58_to_uuid(f58)
#> [1] "8f402757-a10d-447f-9601-656a7b9063cd"
#> [2] "f99091f8-dabf-4b91-9c6e-978156f9ad56"
#> [3] "21d82b56-09b2-4389-a90f-90850988c56a"
#> [4] "5db66b61-46a3-4eda-a23e-38f6f067a111"
#> [5] "95b67b20-440d-4813-af8b-4e6c10c21491"
```

## Addendum

Code to generate uuids taken from
[@rkg8](https://github.com/rkg82/uuid-v4)

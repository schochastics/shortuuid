
<!-- README.md is generated from README.Rmd. Please edit that file -->

# shortuuid

<!-- badges: start -->
<!-- badges: end -->

The goal of shortuuid is to …

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
#> 6019d143-89d7-4410-9efc-f14b07588590
```

``` r
is.uuid(id)
#> [1] TRUE
```

``` r
# alphabet: "123456789ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnopqrstuvwxyz"
uuid_to_bitcoin58(id)
#> [1] "CsHPuEKk1WxNjtsZ1rkY7H"
```

``` r
# alphabet: "123456789abcdefghijkmnopqrstuvwxyzABCDEFGHJKLMNPQRSTUVWXYZ"
uuid_to_flickr58(id)
#> [1] "cShoUejK1vXnJTSy1RKx7h"
```

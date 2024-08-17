
<!-- README.md is generated from README.Rmd. Please edit that file -->

# shortuuid

<!-- badges: start -->
<!-- badges: end -->

The goal of shortuuid is to generate and translate standard UUIDs into
shorter - or just different - formats and back.

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
#> 887b0638-4156-49ba-ba3b-6d3603822d49
```

``` r
is.uuid(id)
#> [1] TRUE
```

``` r
# alphabet: "123456789ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnopqrstuvwxyz"
uuid_to_bitcoin58(id)
#> [1] "HrVAvJU5w5FaJFtzGEhKMA"
```

``` r
# alphabet: "123456789abcdefghijkmnopqrstuvwxyzABCDEFGHJKLMNPQRSTUVWXYZ"
uuid_to_flickr58(id)
#> [1] "hRuaVit5W5fzifTZgeGjma"
```

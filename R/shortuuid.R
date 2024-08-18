#' Generate a random RFC4122 v4-compliant UUID
#' @param n number of ids to generate
#' @return character vector of uuids
#' @export
generate_uuid <- function(n = 1) {
    if (n <= 0) {
        stop("n must be an integer greater than 0")
    }
    id <- uuid_v4(n = n)
    return(id)
}

#' Convert uuid to base58
#' @inheritParams is.base58
#' @param input character vector of uuids
#' @return character vector of base58 encoded uuids
#' @export
uuid_to_base58 <- function(input, alphabet) {
    if (missing(alphabet)) {
        stop("alphabet missing with no default")
    }
    if (!.is_alphabet(alphabet, 58)) {
        stop("alphabet does not contain 58 unique characters")
    }
    idx <- !validate.uuid(input)
    if (any(idx)) {
        warning("NAs introduced by coercion", call. = FALSE)
    }
    out <- rep(NA_character_, length(input))
    tmp <- uuid_to_base58_cpp(.rmdash(input[!idx]), alphabet)
    out[!idx] <- tmp
    out
}


#' Convert uuid to base58 encoding of flickr
#' @inheritParams uuid_to_base58
#' @return character vector of base58 encoded uuids
#' @export
uuid_to_flickr58 <- function(input) {
    alphabet <- "123456789abcdefghijkmnopqrstuvwxyzABCDEFGHJKLMNPQRSTUVWXYZ"
    uuid_to_base58(input, alphabet)
}

#' Convert uuid to base58 encoding of bitcoin
#' @inheritParams uuid_to_base58
#' @return character vector of base58 encoded uuids
#' @export
uuid_to_bitcoin58 <- function(input) {
    alphabet <- "123456789ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnopqrstuvwxyz"
    uuid_to_base58(input, alphabet)
}

#' Convert base58 to uuid
#' @inheritParams is.base58
#' @param input character vector of base58 strings
#' @return character vector of uuids
#' @export
base58_to_uuid <- function(input, alphabet) {
    if (missing(alphabet)) {
        stop("alphabet missing with no default")
    }
    if (!.is_alphabet(alphabet, 58)) {
        stop("alphabet does not contain 58 unique characters")
    }
    idx <- !is.base58(input, alphabet) | !nchar(input) %in% c(ceiling(32 * log(16) / log(nchar(alphabet))) + -1:1)
    if (any(idx)) {
        warning("NAs introduced by coercion", call. = FALSE)
    }
    out <- rep(NA_character_, length(input))
    tmp <- .adddash(base58_to_uuid_cpp(input[!idx], alphabet))
    out[!idx] <- tmp
    out
}

#' Convert base58 flickr encoded character vector to uuid
#' @inheritParams base58_to_uuid
#' @return character vector of uuids
#' @export
flickr58_to_uuid <- function(input) {
    alphabet <- "123456789abcdefghijkmnopqrstuvwxyzABCDEFGHJKLMNPQRSTUVWXYZ"
    base58_to_uuid(input, alphabet)
}

#' Convert base58 bitcoin encoded character vector to uuid
#' @inheritParams base58_to_uuid
#' @return character vector of uuids
#' @export
bitcoin58_to_uuid <- function(input) {
    alphabet <- "123456789ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnopqrstuvwxyz"
    base58_to_uuid(input, alphabet)
}

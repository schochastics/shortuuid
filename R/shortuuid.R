#' Generate a random RFC4122 v4-compliant UUID
#' @param n number of ids to generate
#' @export
generate_uuid <- function(n = 1) {
    if (n <= 0) {
        stop("n must be an integer greater than 0")
    }
    id <- uuid_v4(n = n)
    return(id)
}

#' Convert uuid to base58
#' @param input uuid
#' @param alphabet character vector representing alphabet
#' @export
uuid_to_base58 <- function(input, alphabet) {
    if (missing(alphabet)) {
        stop("alphabet missing with no default")
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


#' Convert uuid to flickr58
#' @param input character
#' @export
uuid_to_flickr58 <- function(input) {
    alphabet <- "123456789abcdefghijkmnopqrstuvwxyzABCDEFGHJKLMNPQRSTUVWXYZ"
    uuid_to_base58(input, alphabet)
}

#' Convert uuid to flickr58
#' @param input character
#' @export
uuid_to_bitcoin58 <- function(input) {
    alphabet <- "123456789ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnopqrstuvwxyz"
    uuid_to_base58(input, alphabet)
}

#' Convert base58 to uuid
#' @param input character vector of base58 strings
#' @param alphabet character vector representing alphabet
#' @export
base58_to_uuid <- function(input, alphabet) {
    if (missing(alphabet)) {
        stop("alphabet missing with no default")
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

#' Convert flickr58 to uuid
#' @param input character
#' @export
flickr58_to_uuid <- function(input) {
    alphabet <- "123456789abcdefghijkmnopqrstuvwxyzABCDEFGHJKLMNPQRSTUVWXYZ"
    base58_to_uuid(input, alphabet)
}

#' Convert uuid to flickr58
#' @param input character
#' @export
bitcoin58_to_uuid <- function(input) {
    alphabet <- "123456789ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnopqrstuvwxyz"
    base58_to_uuid(input, alphabet)
}

#' Generate a random RFC4122 v4-compliant UUID
#' @export
generate_uuid <- function() {
    id <- uuid_v4()
    class(id) <- c("uuid", class(id))
    id
}

#' Convert string to base58
#' @param input uuid
#' @param alphabet character representing alphabet
#' @export
uuid_to_base58 <- function(input, alphabet) {
    if (missing(alphabet)) {
        stop("alphabet missing with no default")
    }
    if (!validate.uuid(input)) {
        stop("input is not a valid uuid")
    }
    uuid_to_base58_cpp(.rmdash(input), alphabet)
}


#' Convert string to flickr58
#' @param input character
#' @export
uuid_to_flickr58 <- function(input) {
    alphabet <- "123456789abcdefghijkmnopqrstuvwxyzABCDEFGHJKLMNPQRSTUVWXYZ"
    uuid_to_base58(input, alphabet)
}

#' Convert string to flickr58
#' @param input character
#' @export
uuid_to_bitcoin58 <- function(input) {
    alphabet <- "123456789ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnopqrstuvwxyz"
    uuid_to_base58(input, alphabet)
}

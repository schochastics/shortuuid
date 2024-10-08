.rmdash <- function(x) {
    gsub("\\-", "", x)
}

.adddash <- function(x) {
    # if (nchar(x) != 32) {
    #     stop("Invalid UUID string length. UUID without dashes should be exactly 32 characters.")
    # }

    # Insert dashes at the correct positions
    formatted_uuid <- paste0(
        substr(x, 1, 8), "-",
        substr(x, 9, 12), "-",
        substr(x, 13, 16), "-",
        substr(x, 17, 20), "-",
        substr(x, 21, 32)
    )

    return(formatted_uuid)
}

#' check if object is of class uuid
#' @param x A character vector
#' @export
is.uuid <- function(x) {
    return(validate.uuid(x))
}

# #' convert valid string to uuid object
# #' @param x A uuid object
# #' @param ... additional arguments to print
# as.uuid <- function(x) {
#     idx <- !validate.uuid(x)
#     if (any(idx)) {
#         warning("NAs introduced by coercion", call. = FALSE)
#     }
#     x[idx] <- NA_character_
#     class(x[!idx]) <- c("uuid", class(x[!idx]))
#     x
# }

#' validate if a string is a uuid
#' @inheritParams is.uuid
#' @export
validate.uuid <- function(x) {
    rege <- "^[0-9a-f]{8}-[0-9a-f]{4}-[0-5][0-9a-f]{3}-[089ab][0-9a-f]{3}-[0-9a-f]{12}$"
    return(grepl(rege, x))
}

.ulength <- function(x) {
    length(unique(strsplit(x, "")[[1]]))
}

.is_alphabet <- function(x, len = 58) {
    return(.ulength(x) == len)
}


#' validate if character vector is base58 encoded
#' @inheritParams is.uuid
#' @param alphabet character vector representing an alphabet
#' @export
is.base58 <- function(x, alphabet) {
    if (missing(alphabet)) {
        stop("alphabet missing with no default")
    }
    if (!.is_alphabet(alphabet, 58)) {
        stop("alphabet does not contain 58 unique characters")
    }
    return(is_valid_alphabet_cpp(x, alphabet))
}

.rmdash <- function(x) {
    gsub("\\-", "", x)
}

.adddash <- function(x) {
    if (nchar(x) != 32) {
        stop("Invalid UUID string length. UUID without dashes should be exactly 32 characters.")
    }

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
#' Print uuid
#' @param x A uuid object
#' @param ... additional arguments to print
#' @export
print.uuid <- function(x, ...) {
    cat(x)
}

#' check if object is of class uuid
#' @param x A uuid object
#' @param ... additional arguments to print
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
#' @param x a character vector to check
#' @export
validate.uuid <- function(x) {
    rege <- "^[0-9a-f]{8}-[0-9a-f]{4}-[0-5][0-9a-f]{3}-[089ab][0-9a-f]{3}-[0-9a-f]{12}$"
    return(grepl(rege, x))
}


#' validate if string is base58
#' @param x a character vector to check
#' @param alphabet character vector representing alphabet
#' @export
is.base58 <- function(x, alphabet) {
    if (missing(alphabet)) {
        stop("alphabet missing with no default")
    }
    return(is_valid_alphabet_cpp(x, alphabet))
}

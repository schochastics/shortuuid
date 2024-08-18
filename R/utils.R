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

#' check for uuid
#' @param x A uuid object
#' @param ... additional arguments to print
#' @export
is.uuid <- function(x) {
    inherits(x, "uuid")
}

#' string to uuid
#' @param x A uuid object
#' @param ... additional arguments to print
#' @export
as.uuid <- function(x) {
    if (!validate.uuid(x)) {
        stop("x is not a proper uuid")
    }
    class(x) <- c("uuid", class(x))
    x
}

#' validate if string is uuid
#' @param x a character
#' @export
validate.uuid <- function(x) {
    rege <- "^[0-9a-f]{8}-[0-9a-f]{4}-[0-5][0-9a-f]{3}-[089ab][0-9a-f]{3}-[0-9a-f]{12}$"
    grepl(rege, x)
}

.rmdash <- function(x) {
    gsub("\\-", "", x)
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
    class(x) <- c("uuid", class(x))
    x
}

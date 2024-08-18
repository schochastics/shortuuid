test_that("is.uuid", {
    expect_equal(is.uuid("12345"), FALSE)
    expect_equal(is.uuid(12345), FALSE)
    expect_equal(is.uuid(NA), FALSE)
})

test_that("is.base58", {
    alphabet <- "123456789ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnopqrstuvwxyz"
    expect_equal(is.base58("12345", alphabet), TRUE)
    expect_equal(is.base58("!!!!!", alphabet), FALSE)
    expect_error(is.base58("12345", "abcd"))
    expect_error(is.base58("12345", "12345"))
    expect_error(is.base58("12345", paste0(alphabet, ">")))
})

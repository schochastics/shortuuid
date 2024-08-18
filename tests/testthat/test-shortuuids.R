test_that("bitcoin encoding", {
    id <- "c73087da-627a-4f00-8786-fcc4f47db57f"
    expect_equal(uuid_to_bitcoin58(id), "RbcZUzUfnGugha7DVu3fAE")
    expect_warning(uuid_to_bitcoin58("abcde"))
})

test_that("flickr encoding", {
    id <- "a44521d0-0fb8-4ade-8002-3385545c3318"
    expect_equal(uuid_to_flickr58(id), "mhvXdrZT4jP5T8vBxuvm75")
    expect_warning(uuid_to_flickr58("abcde"))
})

test_that("bitcoin decoding", {
    id <- "c73087da-627a-4f00-8786-fcc4f47db57f"
    expect_equal(bitcoin58_to_uuid(uuid_to_bitcoin58(id)), id)
})

test_that("flickr decoding", {
    id <- "a44521d0-0fb8-4ade-8002-3385545c3318"
    expect_equal(flickr58_to_uuid(uuid_to_flickr58(id)), id)
})

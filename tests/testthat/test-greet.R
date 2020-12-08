test_that("multiplication works", {
  expect_equal(2 * 2, 4)
})
test_that("output is a character string", {
  out <- greet(whom = "World")
  expect_character(x = out, len = 1, pattern = "Hello.*!")
})


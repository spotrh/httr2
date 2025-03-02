test_that("can override requests through mocking", {
  resp <- response()
  req <- request("https://google.com")

  expect_equal(with_mock(~ resp, req_perform(req)), resp)

  local_mock(~ resp)
  expect_equal(req_perform(req), resp)
})

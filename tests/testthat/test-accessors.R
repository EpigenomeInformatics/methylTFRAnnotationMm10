test_that("motif set validation rejects unknown sets", {
  expect_error(getGCfreq("not_a_motif_set"), "Invalid motif set")
  expect_error(getGCfreq(c("a", "b")), "Invalid motif set")
})

test_that("motif set validation is case insensitive", {
  expect_identical(methylTFRAnnotationMm10:::.check_motif_set("ALTIUS"), "altius")
})

test_that("metadata.csv covers every declared motif set", {
  md <- utils::read.csv(system.file("extdata", "metadata.csv", package = "methylTFRAnnotationMm10"))
  for (s in methylTFRAnnotationMm10:::.MOTIF_SETS) {
    expect_true(any(grepl(paste0("^", s, "_"), md$Title)),
      info = s
    )
  }
})

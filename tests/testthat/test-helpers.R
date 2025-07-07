test_that(
  desc = "return dashed styles if p-value <0.05, else empty string",
  code = {
    expect_identical(
      add_edge_style(pvals = 0.049),
      ""
    )
    expect_identical(
      add_edge_style(pvals = 0.05),
      ""
    )
    expect_identical(
      add_edge_style(pvals = 0.051),
      " style = dashed "
    )
  }
)

test_that(
  desc = "create styles based on a list of pvalues",
  code = {
    expect_identical(
      create_edge_styles(pvals = list(0.049, 0.05, 0.051)),
      c("", "", "")
    )
    expect_identical(
      create_edge_styles(pvals = list(0.049, 0.05, 0.051), edge_styles = T),
      c("", "", " style = dashed ")
    )
  }
)


test_that(
  desc = "Generates standard significance stars",
  code = {
    expect_identical(
      sig_stars(pval = 0.051),
      ""
    )
    expect_identical(
      sig_stars(pval = 0.049),
      "*"
    )
    expect_identical(
      sig_stars(pval = 0.01),
      "**"
    )

    expect_identical(
      sig_stars(pval = 0.0099),
      "**"
    )
    expect_identical(
      sig_stars(pval = 0.001),
      "***"
    )
    expect_identical(
      sig_stars(pval = 0.00099),
      "***"
    )
  }
)

context("sanity checks")

################################################################################
## Sanity checks on random number generators
check_r <- function(a, b, mean, sd, n=10000) {
  prefix <- sprintf("R: a=%f, b=%f, mean=%f, sd=%f", a, b, mean, sd)
  x <- truncnorm__rtruncnorm(n, a, b, mean, sd)
  e.x <- mean(x)

  ## FIXME: Really sample from open intervall?
  test_that(prefix, {
    expect_true(all(x > a))
    expect_true(all(x < b))
  })
}

## rtruncnorm == rnorm:
check_r(-Inf, Inf, 0, 1)

## 0 in (a, b):
check_r(-1, 1, 0, 1)
check_r(-1, 1, 1, 1)
check_r(-1, 1, 0, 2)

## 0 < (a, b):
check_r(1, 2, 0, 1)
check_r(1, 2, 1, 1)
check_r(1, 2, 0, 2)

## 0 > (a, b):
check_r(-2, -1, 0, 1)
check_r(-2, -1, 1, 1)
check_r(-2, -1, 0, 2)

## left truncation:
check_r(-2, Inf, 0, 1)
check_r(-2, Inf, 1, 1)
check_r(-2, Inf, 0, 2)
check_r( 0, Inf, 0, 1)
check_r( 0, Inf, 1, 1)
check_r( 0, Inf, 0, 2)
check_r( 2, Inf, 0, 1)
check_r( 2, Inf, 1, 1)
check_r( 2, Inf, 0, 2)

check_r(-0.2, Inf, 0, 1)
check_r(-0.2, Inf, 1, 1)
check_r(-0.2, Inf, 0, 2)
check_r( 0.0, Inf, 0, 1)
check_r( 0.0, Inf, 1, 1)
check_r( 0.0, Inf, 0, 2)
check_r( 0.2, Inf, 0, 1)
check_r( 0.2, Inf, 1, 1)
check_r( 0.2, Inf, 0, 2)

## Right truncation:
check_r(-Inf, -2, 0, 1)
check_r(-Inf, -2, 1, 1)
check_r(-Inf, -2, 0, 2)
check_r(-Inf,  0, 0, 1)
check_r(-Inf,  0, 1, 1)
check_r(-Inf,  0, 0, 2)
check_r(-Inf,  2, 0, 1)
check_r(-Inf,  2, 1, 1)
check_r(-Inf,  2, 0, 2)

check_r(-Inf, -0.2, 0, 1)
check_r(-Inf, -0.2, 1, 1)
check_r(-Inf, -0.2, 0, 2)
check_r(-Inf,  0.0, 0, 1)
check_r(-Inf,  0.0, 1, 1)
check_r(-Inf,  0.0, 0, 2)
check_r(-Inf,  0.2, 0, 1)
check_r(-Inf,  0.2, 1, 1)
check_r(-Inf,  0.2, 0, 2)

## Extreme examples:
check_r(-5, -4, 0, 1)

## Integer examples:
check_r(-5L, -4L, 0L, 1L)


##
## Don't segfault!
##

context("reg-segfault")

expect_error(truncnorm__rtruncnorm(1, numeric(0), 1, 0, 1))
expect_error(truncnorm__rtruncnorm(1, 0, numeric(0), 0, 1))
expect_error(truncnorm__rtruncnorm(1, 0, 1, numeric(0), 1))
expect_error(truncnorm__rtruncnorm(1, 0, 1, 0, numeric(0)))

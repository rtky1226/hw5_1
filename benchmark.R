library(microbenchmark)
source("llr_function.R")

set.seed(123)
n = 15

x = rnorm(n)
y = rnorm(x + rnorm(n))
z = seq(-1, 1, length.out = 100)


# Benchmarking
results <- microbenchmark(
  llr_result = llr(omega = 2, x = x, y = y, z = z),
  times = 1000
)

print(results)


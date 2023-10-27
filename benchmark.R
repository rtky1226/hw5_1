library(microbenchmark)
source("llr_function.R")

set.seed(123)
n = 15
## a very simple regression model
x = rnorm(n)
y = rnorm(x + rnorm(n))
z = seq(-1, 1, length.out = 100)


# Benchmarking
results <- microbenchmark(
  llr_result = llr(omega = 2, x = x, y = y, z = z),
  llr_new_result = llr_new(omega = 2, x = x, y = y, z = z),
  times = 1000 # number of times to run the expression for the benchmark
)

print(results)


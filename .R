library(devtools)
library(usethis)
use_description()
use_namespace()
use_gpl3_license(name = "ming")
create_package()
use_package("dplyr")
use_package("tibble")
usethis::use_vignette(name = "overview")
########Exercise 2 Data#######
plt_DW <- read_xlsx("Dry_weight.xlsx")
plt_DW
use_data(plt_DW)
use_r("data")
build(".")

#######Exercise 3 Functions and Documentation#######
use_r(name = "greet")
#######Exercise 4 Building and checks#######
library(devtools)
build(".")
check(".")
spell_check()
tidy_dir("/R")
source("https://install-github.me/MangoTheCat/goodpractice")
library(goodpractice)
gp("ABSOLUTE_PATH_TO_YOUR_PACKAGE")
#######Exercise 5 Testing#######
report_summary(data = iris, measure = "median")
#> Error in median.default(x = data, na.rm = na.rm) : need numeric data
#
# "what is that supposed to mean, I provided 'numeric data'!?"

report_summary(data = iris$Sepal.Length, measure = "sd")
#> Error in report_summary(iris$Sepal.Length, measure = "sd") : 
#>   object 'out' not found
#
# "why the hell didn't it find 'out'?"
report_summary <- function(data, measure, na.rm = TRUE, quantiles = NULL){
  
  assertVector(x = data, strict = TRUE)
  assertChoice(x = measure, choices = c("mean", "median"))
  assertLogical(x = na.rm, any.missing = FALSE, len = 1)
  assertNumeric(x = quantiles, lower = 0, upper = 1, any.missing = FALSE, null.ok = TRUE)
  
  if(measure == "mean"){
    out <- mean(x = data, na.rm = na.rm)
  } else if(measure == "median"){
    out <- median(x = data, na.rm = na.rm)  
  }
  out <- round(x = out, digits = 2)
  
  if(!is.null(quantiles)){
    out <- c(out, quantile(data, probs = quantiles, na.rm = na.rm))
  }
  names(out)[1] <- c(measure)
  
  return(out)
}
report_summary(data = iris, measure = "median")
report_summary(data = iris$Sepal.Length, measure = "sd")
use_testthat()
use_test("greet")

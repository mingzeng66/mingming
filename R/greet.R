#' Kindly greet the first user of your package
#'
#' @param whom [character(1)]\cr The person/entity that shall be greeted.
#'
#' @return Character string that greets.
#' @export
#'
#' @examples
#' # greet the world ...
#' greet(whom = "World")
#'
#' # ... or a range of numbers
#' greet(c(1, 2, 3, 4))

greet <- function(whom){
  message(paste0("Hello '", whom, "'!"))
}

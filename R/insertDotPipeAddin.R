#' Insert \%.>\% .
#'
#' Call this function as an addin to insert \code{\link[wrapr]{\%.>\%}} at the cursor position.
#'
#' @export
insertDotPipeAddin <- function() {
  rstudioapi::insertText(" %.>% ")
}

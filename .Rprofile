local_profile <- path.expand("~/.Rprofile.local")
if (file.exists(local_profile)) {
  source(local_profile)
}

if (interactive()) {
  suppressMessages(require(devtools))
  .Last <- function() try(savehistory("~/.Rhistory"))
}

options(
  repos = c(CRAN = "https://mirrors.dotsrc.org/cran/"),
  menu.graphics = FALSE,
  lifecycle_verbosity = "warning",
  tidyverse.quiet = TRUE
)

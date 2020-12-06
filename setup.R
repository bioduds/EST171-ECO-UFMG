
r <- getOption("repos")
r["CRAN"] <- "http://cloud.r-project.org"
options(repos=r)

install.packages("dash")

install.packages(c("fiery", "routr", "reqres", "htmltools", "base64enc", "plotly", "mime", "crayon", "devtools"))

library(devtools)

# installs dashHtmlComponents, dashCoreComponents, and dashTable
# and will update the component libraries when a new package is released
devtools::install_github("plotly/dashR", ref="dev", upgrade = TRUE)


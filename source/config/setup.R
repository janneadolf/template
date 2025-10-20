# create folders
dirs <- c(
  "data",
  "media",
  "output"
)
sapply(dirs, dir.create)

# initialize renv
renv::init()

# enable the INBO universe
options(
  repos = c(
    inbo = "https://inbo.r-universe.dev", CRAN = "https://cloud.r-project.org"
  )
)

# install checklist
install.packages("checklist")

# set-up project
checklist::setup_project(".")

# install first packages
pkgs <- c(
  "tidyverse",
  "cyclocomp",
  "quarto",
  "INBOtheme"
)
pkgs_installed <- pkgs %in% rownames(installed.packages())
if (any(pkgs_installed == FALSE)) {
  install.packages(pkgs[!pkgs_installed])
}
# install citr
if (FALSE) devtools::install_github("crsh/citr") # install citr

# write renv lockfile
renv::snapshot()

# update packages
if (FALSE) renv::update()

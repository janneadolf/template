# folder structure -----------------------------------------------------------

# create folders
dirs <- c(
  "data",
  "media",
  "output"
)
sapply(dirs, dir.create)


# renv --------------------------------------------------------------------

# initialize renv
# (don't run if renv should not be used)
renv::init()

# write renv lockfile
# (don't run if renv should not be used)
renv::snapshot()

# update packages (needed here???)
# (don't run if renv should not be used)
renv::update()

# packages ----------------------------------------------------------------

# enable the INBO universe (nedded or global setting???)
# check via: getOption("repos")
options(
  repos = c(
    inbo = "https://inbo.r-universe.dev",
    CRAN = "https://cloud.r-project.org"
  )
)

# install checklist
# (don't run if checklist should not be used)
install.packages("checklist")

# set-up project
# (don't run if checklist should not be used)
checklist::setup_project(".")


# install first packages
pkgs <- c(
  "tidyverse",
  "cyclocomp", # (remove if checklist should not be used)
  "quarto",
  "INBOtheme"
)
pkgs_installed <- pkgs %in% rownames(installed.packages())
if (any(pkgs_installed == FALSE)) {
  install.packages(pkgs[!pkgs_installed])
}

# install citr
devtools::install_github("crsh/citr") # install citr

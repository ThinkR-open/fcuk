usethis::use_build_ignore("dev_history.R")

# CI
usethis::use_github_action_check_standard()
usethis::use_github_action("pkgdown")
usethis::use_github_action("test-coverage")

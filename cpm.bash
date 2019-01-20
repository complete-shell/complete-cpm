# shellcheck shell=bash disable=2034

cpan-module() {
  modules=$COMPLETE_SHELL_CACHE/cpm
  [[ -f $modules ]] || {
    hint "Can't find CPAN modules cache file: '$modules'."
    hint "Try 'complete-shell install cpm'."
    return 0
  }

  local fzf_options=(
    '--layout=reverse'
    '--multi'
    '--height=0'
    '--color=bw'
    '--bind=space:toggle-down,ctrl-space:up+toggle,del:deselect-all+top'
  )

  (echo; cat "$modules") | complete-shell-pager
}

version() (
  hint 'Enter a version string'
)

url() (
  hint 'Enter a URL'
)

class-args() (
  hint 'Enter a class/args'
)

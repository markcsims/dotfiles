# ============================================================
# Nushell Environment
# ============================================================

# ---------- Identity ----------
$env.DEFAULT_USER = "mark"
$env.EMAIL = "mark.sims@bluepie.co.uk"

# ---------- Editor ----------
$env.EDITOR = "nvim"
$env.VISUAL = "nvim"

# ---------- Go ----------
$env.GOPATH = $"($env.HOME)/dev/go"

# ---------- GPG ----------
$env.GPG_TTY = (try { tty } catch { "" })

# ---------- PATH ----------
use std "path add"

# Homebrew (Apple Silicon)
path add /opt/homebrew/bin
path add /opt/homebrew/sbin

# Common locations
path add /usr/local/bin
path add /usr/local/sbin
path add $"($env.HOME)/.local/bin"
path add $"($env.HOME)/bin"

# Go
path add $"($env.HOME)/dev/go/bin"
path add $"($env.GOPATH)/bin"

# Your custom tools
path add $"($env.HOME)/dev/mm/mmgaws"

# ---------- fnm ----------
if not (which fnm | is-empty) {
  ^fnm env --json | from json | load-env

  let node_path = if $nu.os-info.name == "windows" {
    $env.FNM_MULTISHELL_PATH
  } else {
    $"($env.FNM_MULTISHELL_PATH)/bin"
  }

  path add $node_path
}

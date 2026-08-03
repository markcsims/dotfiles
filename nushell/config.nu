# ============================================================
# Nushell Config
# ============================================================

# ---------- History ----------
$env.config.history = {
  max_size: 50000
  sync_on_enter: true
  file_format: "sqlite"
}

# ---------- Core behavior ----------
$env.config.show_banner = false
$env.config.use_ansi_coloring = true
$env.config.edit_mode = "vi"
$env.config.buffer_editor = "nvim"
$env.config.table.mode = "rounded"
$env.config.completions.algorithm = "fuzzy"
$env.PROMPT_INDICATOR = ""
$env.PROMPT_INDICATOR_VI_INSERT = ""

# ---------- Aliases ----------
alias vi     = nvim
alias vim    = nvim
alias gs     = git status -sb
alias gco    = git checkout
alias gc     = git commit
alias gl     = git pull
alias gp     = git push
alias python = /usr/local/bin/python3
alias ibrew  = arch -x86_64 /usr/local/bin/brew

alias trim  = ^ex +'bufdo!%s/\s\+$//e' -scxa
alias retab = ^ex +'set ts=2' +'bufdo retab' -scxa

# ---------- Starship ----------
# Modern method: Nushell auto-loads files from vendor/autoload
# Run these two lines once if the file doesn't exist yet:
#
#   mkdir ($nu.data-dir | path join "vendor/autoload")
#   starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")
#
# After that, no source line is needed.

# ---------- fnm: auto-switch Node version ----------
$env.config.hooks.env_change.PWD = (
  $env.config.hooks.env_change.PWD? | default [] | append {
    condition: {|_, after|
      (
        ($after | path join ".nvmrc" | path exists)
        or ($after | path join ".node-version" | path exists)
      )
    }
    code: {|_, after|
      try {
        ^fnm use --silent-if-unchanged
      } catch { }
    }
  }
)
if not ("TMUX" in $env) and ($env.TERM? != "dumb") {
  ^tmux new-session -A -s base
}


dotfiles

This repository contains configuration files and scripts to set up a personalized development environment. These dotfiles are intended for macOS and include settings for Zsh, tmux, git, ack, and more.

---

### Setup Instructions

To copy your current configuration files into this repository, run:

```sh
sh copy.sh
```

Then symlink or copy these files to your home directory as needed.

---

### File Descriptions

- `.zshrc`: Zsh shell configuration, plugins, aliases, and environment variables. Uses the custom `mortalit` theme.
- `.tmux.conf`: tmux configuration with plugins and custom options for improved workflow.
- `.gitconfig`: Git configuration, aliases, and settings for signing, LFS, and more.
- `.ackrc`: Configuration for the ack search tool, including ignore rules and type definitions.
- `.tern-config`: Tern.js configuration for JavaScript code analysis.
- `copy.sh`: Script to copy dotfiles from your home directory into this repo.
- `mortalit.zsh-theme`: Custom Zsh theme combining features from mortalscumbag and avit themes, with advanced git status prompt.
- `darkside darker.itermcolors`: iTerm2 color scheme in XML format for a dark terminal appearance.
- `.config/`: Directory for additional configuration files (not included in this README).

---

### Usage

1. Clone this repository:

```sh
git clone https://github.com/markcsims/dotfiles.git
cd dotfiles
```

2. Run the setup script:

```sh
sh copy.sh
```

3. Symlink or copy the files to your home directory:

```sh
ln -s $PWD/.zshrc ~/.zshrc
ln -s $PWD/.tmux.conf ~/.tmux.conf
ln -s $PWD/.gitconfig ~/.gitconfig
ln -s $PWD/.ackrc ~/.ackrc
ln -s $PWD/.tern-config ~/.tern-config
# For iTerm2, import darkside darker.itermcolors
```

---

### Vim

For Vim plugin management, use [vim-plug](https://github.com/junegunn/vim-plug).

---

### Author

Mark Sims

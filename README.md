# Dotfiles

<div align="center">

![Terminal](terminal.png)

![forthebadge](https://forthebadge.com/images/badges/built-by-hipsters.svg)
![forthebadge](https://forthebadge.com/images/badges/winter-is-coming.svg)
</div>

- **Terminal**: [Alacritty](https://github.com/jwilm/alacritty)
- **Terminal multiplexer**: [Tmux](https://github.com/tmux/tmux)
- **Editor**: [Neovim](https://github.com/neovim/neovim)

# Installation
## How to clone and config this repository

I use GNU stow to manage my dotfiles. 

Install stow:

```bash
sudo apt install stow
```

Clone this repository directly in your home folder, e.g., `~/dotfiles`.

```bash
git clone https://github.com/camilanovaes/my-dotfiles.git ~/dotfiles
```

After that just run stow to create the symbol links as follows:

```bash
cd ~/dotfiles
stow */
```

That's it! :)

# Configuration
## Alacritty
### Installation
On ubuntu/debin run:

```bash
sudo add-apt-repository ppa:mmstick76/alacritty
sudo apt update
sudo apt install alacritty
```
## Neovim (> v0.3)
### Installation

Check out the neovim installation
[page](https://github.com/neovim/neovim/wiki/Installing-Neovim) to install the
latest version.

### Install plug
Download `plug` into the `.local/share/nvim/site/autoload` directory:

```bash
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

After that, enter on nvim and run `:PluginInstall`.

## ZSH
ZSH is one of the most feature-rich shells for Unix.

### Installation
On ubuntu/debian run:

```
sudo apt install zsh
```

### Oh-My-Zsh
Oh-My-Zsh is a framework to manage Zsh configuration. It has plugins and themes for ZSH.
To install just run:

```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

### Plugins
#### ZSH-autosuggestions
Provides auto completion for shell commands
To install just run the following command:

```bash
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

#### ZSH-syntax-hightlighting
Provides syntax hightlighting on the shell
To install just run:

```
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

#### FZF
Provides fuzzy search
To install just run:

```
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
```

## Git
### Pretty git log
Add the following to `$HOME/.gitconfig`:
```
[alias]
   l = log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all
```

### Use watch with color support on git commands
To use color in `git status` when being run by `watch`, you need to run the following command:

```
git config --global color.status always
```

After, you can run:

```
watch --color git status
```

## Tmux
### Installation
On ubuntu/debian run:

```bash
apt install tmux
```

### Tmux plugin manager (TPM)
To install TPM, just pull the git repository:

```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

### Tmuxp
With `tmuxp` is possible to create tmux reusable sessions.

To install, just run:

```bash
pip3 install --user tmuxp
```

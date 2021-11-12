# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# unable CTRL-s to freeze
stty stop undef
stty start undef



export PATH=/usr/local/bin:$PATH

#TeX Live2020
export PATH=/usr/local/texlive/2020/bin/x86_64-darwin:$PATH
export MANPATH=/usr/local/texlive/2020/texmf-dist/doc/man:$MANPATH
export INFOPATH=/usr/local/texlive/2020/texmf-dist/doc/info:$INFOPATH

# Golang
export GOBIN=$HOME/go/bin
export GOPATH=$HOME/go

# mySQL
export PATH=$PATH:/usr/local/mysql/bin

# postgreSQL
# If PGDATA is set, the command "% postgres" starts the database server.
# If not, the command "% postgres -D /usr/local/var/postgres" does.  
export PGDATA=/usr/local/var/postgres

# nodebrew
export PATH=$PATH:$HOME/.nodebrew/current/bin

# yarn
export PATH=$PATH:/$HOME/.yarn/bin

# DIY commands
export PATH=$PATH:/$HOME/Dropbox/system/mac/commands

export XDG_CONFIG_HOME=~/.config

# python
export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"
eval "$(pyenv init -)"

# Add Visual Studio Code (code)
export PATH=$PATH:/Applications/"Visual Studio Code.app"/Contents/Resources/app/bin




## history management
HISTFILE=$ZDOTDIR/.zsh-history
HISTSIZE=100000
SAVEHIST=1000000

## share history with the other zshes
setopt inc_append_history
setopt share_history

## パスを直接入力してもcdする
setopt AUTO_CD

## 環境変数を補完
setopt AUTO_PARAM_KEYS

# Aliases
alias ls='ls -aF'

# Keybind 
# disable dangerous keybind
bindkey -r '^o'  #<C-o>
bindkey -r '^j'  #<C-j>
bindkey -r '^d'  #<C-d>
bindkey -r '^w'  # Use in neovim





### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/z-a-rust \
    zdharma-continuum/z-a-as-monitor \
    zdharma-continuum/z-a-patch-dl \
    zdharma-continuum/z-a-bin-gem-node

### End of Zinit's installer chunk
source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

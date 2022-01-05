export PATH=$HOME/bin:$HOME/mambaforge/bin:/usr/local/bin:$PATH
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

# initiate zinit
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
source "${ZINIT_HOME}/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# load prompt theme
zinit snippet OMZP::git
zinit snippet OMZL::git.zsh
zinit snippet OMZL::theme-and-appearance.zsh
zinit cdclear -q
setopt promptsubst
zinit snippet OMZT::ys

autoload -U colors
colors

# load plugins
zinit snippet OMZL::completion.zsh
zinit snippet OMZL::functions.zsh
zinit ice svn
zinit snippet OMZ::plugins/macos
zinit light zsh-users/zsh-autosuggestions
zinit snippet https://github.com/junegunn/fzf/blob/master/shell/completion.zsh
zinit snippet https://github.com/junegunn/fzf/blob/master/shell/key-bindings.zsh
zinit snippet OMZP::fasd
zinit wait lucid atinit'zicompinit; zicdreplay' for \
    zdharma-continuum/fast-syntax-highlighting

# some customization
zle_highlight=('paste:none')
source ~/mambaforge/etc/profile.d/conda.sh
if [ "$(command -v exa)" ]; then
    alias ls='exa -G  --color auto --icons -s type'
    alias la='exa -G  --color auto --icons -a -s type'
    alias ll='exa -l --color always --icons -a -s type'
fi

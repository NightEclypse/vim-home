# Clean, simple, compatible and meaningful.
# Tested on Linux, Unix and Windows under ANSI colors.
# It is recommended to use with a dark background and the font Inconsolata.
# Colors: black, red, green, yellow, *blue, magenta, cyan, and white.
# 
# http://ysmood.org/wp/2013/03/my-ys-terminal-theme/
# Mar 2013 ys

# Machine name.
function box_name {
    [ -f ~/.box-name ] && cat ~/.box-name || hostname
}

# Directory info.
local current_dir='${PWD/#$HOME/~}'

# Ruby env.
local ruby_env=''
if which rvm-prompt &> /dev/null; then
  ruby_env=' ‹$(rvm-prompt i v g)›%{$reset_color%}'
else
  if which rbenv &> /dev/null; then
    ruby_env=' ‹$(rbenv version-name)›%{$reset_color%}'
  fi
fi

function prompt_char {
  git branch >/dev/null 2>/dev/null && echo "±" && return
  echo '○'
}

local prompt_char='$(prompt_char)'

# Git info.
local git_info='$(git_prompt_info)'
ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[white]%}on%{$reset_color%} git:%{$fg[cyan]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
#ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}x"
#ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg[green]%}o"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$FG[202]%}✘"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$FG[040]%}✔"

# Prompt format: \n # USER at MACHINE in DIRECTORY on git:BRANCH STATE [TIME] \n $ 
PROMPT="
%{$terminfo[bold]$fg[blue]%}╭─${prompt_char}%{$reset_color%} \
%{$FG[239]%}%n \
%{$fg[white]%}at \
%{$FG[033]%}$(box_name) \
%{$fg[white]%}in \
%{$terminfo[bold]$fg[yellow]%}${current_dir}%{$reset_color%}\
${git_info} \
%{$fg[white]%}using%{$FG[239]%}${ruby_env} \
%{$fg[white]%}[%*]
%{$terminfo[bold]$fg[blue]%}╰─${prompt_char} %{$reset_color%}"

if [[ "$(whoami)" == "root" ]]; then
PROMPT="
%{$terminfo[bold]$fg[blue]%}%{$reset_color%} \
%{$bg[yellow]%}%{$FG[239]%}%n%{$reset_color%} \
%{$fg[white]%}at \
%{$FG[033]%}$(box_name) \
%{$fg[white]%}in \
%{$terminfo[bold]$fg[yellow]%}${current_dir}%{$reset_color%}\
${git_info} \
%{$fg[white]%}[%*]
%{$terminfo[bold]$fg[blue]%}╰─${prompt_char} %{$reset_color%}"
fi

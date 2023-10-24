# xtl's hand made zshell theme
#
# Author: Falcon 草(tsao) <x@xtl.tw>
#
# Read lots of things from
# > https://blog.carbonfive.com/writing-zsh-themes-a-quickref/
# > https://zsh.sourceforge.io/Doc/Release/Prompt-Expansion.html
# > https://zsh.sourceforge.io/Doc/Release/Expansion.html#Parameter-Expansion-Flags
# > https://man7.org/linux/man-pages/man3/strftime.3.html
#
# Some other stuff
# > Chassis type list
# >> https://superuser.com/questions/877677/programatically-determine-if-an-script-is-being-executed-on-laptop-or-desktop/877796

desktop=(3,6,7,12,13)
laptop=(8,9,10,13)

get_device(){
  if [[ $(uname) == "Darwin" ]]; then
    echo "";
  elif [[ $(uname) == "Linux" ]]; then
    echo "⌬";
  else
    chassis=$(cat /sys/class/dmi/id/cexithassis_type)
    if [[ "${desktop}" =~ "${chassis}" ]]; then
      echo "⌸";
    elif [[ "${laptop}" =~ "${chassis}" ]]; then
      echo "💻 ";
    elif [[ chassis == 5 ]]; then
      echo "🍕";
    else
      echo "⌬";
    fi
  fi
}

generate_prompt(){
  echo "│"
  echo "├─ %{$FG[081]%}%n %{$FG[247]%}$(get_device) %{$FG[157]%}%m %{$FG[247]%}⚙ %{$FG[159]%}%~%f $(git_prompt_info)"
  echo "└─> "
}

# PROMPT='%F{10} %c %n@%m
# %(!.#.$) %F{15} '

ZSH_THEME_GIT_PROMPT_PREFIX="ᚶ %{$FG[190]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%f"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}⤬%f"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg[green]%}✓%f"

PROMPT='$(generate_prompt)'

RPROMPT='%(?.%{$FG[118]%}ACK%f.%{$FG[196]%}⤬%f ) [%D{%I:%M:%S%p}]'%

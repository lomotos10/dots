############### custom lines #####################
alias vi=nvim

if [ -z "$TMUX"  ]; then
  sessions=$(tmux ls 2> /dev/null | grep "window" | wc -l)
  attached=$(tmux ls 2> /dev/null | grep "attached" | wc -l)
  detached=`expr $sessions - $attached`
  if [ $detached == 0 ]; then
    tmux new-session
  else
    tmux attach
  fi
  sessions=$(tmux ls 2> /dev/null | grep "window" | wc -l)
  attached=$(tmux ls 2> /dev/null | grep "attached" | wc -l)
  detached=`expr $sessions - $attached`
  if [ $detached == 0 ]; then
    exit
  fi
fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

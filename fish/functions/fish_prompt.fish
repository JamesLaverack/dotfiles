function fish_prompt
  set -l last_status $status

  # Prompt status only if it's not 0
  set -l stat_color 'normal'
  if test $last_status -ne 0
    set stat_color 'red'
  end

  set -l cwd (path basename $PWD)
  if test "$PWD" = "$HOME"
    set cwd '~'
  end

  string join '' -- (set_color $fish_color_cwd) $cwd (set_color normal) (set_color $stat_color) '$' (set_color normal) ' '
end


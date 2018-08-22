
set -g status-left-length 32
set -g status-right-length 150
set -g status-interval 5

# default to a dark color scheme
source-file $HOME/.misc/tmux/theme-dark.conf

if-shell '[ -x "$HOME/bin/color-mode-for-term" ] && [ "$($HOME/bin/color-mode-for-term)" = "light" ]' \
    'source-file $HOME/.misc/tmux/theme-light.conf'

set -g window-status-format "#I #W"
set-window-option -g  window-status-current-format "#[bold]#I #W"

#inlicate pane number that is zoomed
tm_window_zoom_indicator="#{?window_zoomed_flag,🔎 #P,}"
tm_session_name_prefix_icon="☞"
tm_session_name="$tm_session_name_prefix_icon #[fg=colour243]#S"
tm_date="%R %d %b"

set -g status-left $tm_session_name' '$tm_window_zoom_indicator
set -g status-right $tm_date' #h'

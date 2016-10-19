
set -g status-left-length 32
set -g status-right-length 150
set -g status-interval 5

# statusbar colors
set-option -g status-bg default
set-option -g status-fg colour136 #faint yellow
set-option -g status-attr default

# window title colors
set-window-option -g window-status-fg colour236 #faint gray
set-window-option -g window-status-bg default
set-window-option -g window-status-attr dim

# active window title colors
set-window-option -g window-status-current-fg colour247 #bright gray
set-window-option -g window-status-current-bg default
set-window-option -g window-status-current-attr bright

# pane border
set-option -g pane-border-fg colour235 #almost black
set-option -g pane-active-border-fg colour230 #bright yellow

# message text
set-option -g message-bg colour235 #almost black
set-option -g message-fg colour231 #almoust white

# pane number display
set-option -g display-panes-active-colour colour33 #blue
set-option -g display-panes-colour colour166 #orange

# clock
set-window-option -g clock-mode-colour colour64 #green

# bell
set-window-option -g window-status-bell-style fg=colour235,bg=colour160 #black, red

set -g window-status-format "#I #W"
set-window-option -g  window-status-current-format "#[bold]#I #W"

#inlicate pane number that is zoomed
tm_window_zoom_indicator="#{?window_zoomed_flag,#P[+],}"
tm_session_name_prefix_icon="⚓"
tm_session_name="$tm_session_name_prefix_icon #[fg=colour243]#S"
tm_date="%R %d %b"

set -g status-left $tm_session_name' '$tm_window_zoom_indicator
set -g status-right $tm_date' #h'

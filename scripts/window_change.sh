    1 #!/bin/bash
    2 APP_NAME="OBS Studio"
    3 WINDOW_ID=$(aerospace list-windows --all | awk -v app="$APP_NAME" '$0 ~ app && $0 !~ "Chat" {print $1}')
    4 PIP_WIN=$(aerospace list-windows --all | grep -E "(Picture in Picture)" | awk '{print $1}')
    5 CURRENT_WORKSPACE=$(aerospace list-workspaces --focused)
    6 FOCUSED_WORKSPACE=$AEROSPACE_FOCUSED_WORKSPACE
    7 if [ -n "$WINDOW_ID" ]; then
    8   aerospace move-node-to-workspace $FOCUSED_WORKSPACE --window-id $WINDOW_ID
    9 fi
   10 if [[ -n "$PIP_WIN" ]]; then
   11   aerospace move-node-to-workspace --window-id "$PIP_WIN" "$CURRENT_WORKSPACE"
   12 fi

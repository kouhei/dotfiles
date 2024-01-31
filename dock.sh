echo "delete dock list"
# dockから全て消す
text=$(dockutil --list)
# echo $text

# すでにdockにあるものを消す
echo "reset dock"
dockutil --no-restart --remove all

echo "add dock items"
# dockに追加する
# TODO:メーラーも追加したい
dockutil -a  "file:///Applications/Google Chrome.app/" --no-restart
dockutil -a "file:///Applications/Slack.app/" --no-restart
dockutil -a "file:///Applications/Discord.app/" --no-restart
dockutil -a "file:///Applications/Visual Studio Code.app/" --no-restart
dockutil -a "file:///Applications/Microsoft To Do.app/" --no-restart
dockutil -a "file:///Applications/DeepL.app/" --no-restart
dockutil -a "file:///System/Applications/Utilities/Terminal.app/" --no-restart
dockutil -a "file:///Users/kouhei/Downloads/" --display stack --view grid -s others
echo "delete dock list"
# dockから全て消す
text=$(dockutil --list)
echo $text

while IFS= read -r line; do
    $tmp=echo "$line" | grep -o 'file://[^ ]*' | cut -f1 | sed 's/%20/ /g'
    dockutil -r $tmp
done <<< "$text"

echo "add dock list"
# dockに追加する
# メーラー
dockutil -a --no-restart "file:///Applications/Google Chrome.app/"
dockutil -a --no-restart "file:///Applications/Slack.app/"
dockutil -a --no-restart "file:///Applications/Discord.app/"
dockutil -a --no-restart "file:///Applications/Visual Studio Code.app/"
dockutil -a --no-restart "file:///Applications/Microsoft To Do.app/"
dockutil -a --no-restart "file:///Applications/DeepL.app/"
dockutil -a --no-restart "file:///System/Applications/Utilities/Terminal.app/"
dockutil -a "file:///Users/kouhei/Downloads/"
echo "apt update & upgrade"
yes | sudo apt-get update
yes | sudo apt-get upgrade
echo "install vim tmux zsh curl vlc build-essential"
sudo apt-get install -y vim tmux zsh curl vlc build-essential
# Install packages
sudo pacman -S sway waybar swaybg swaylock swayidle nvim tmux alacritty zsh tofi picom polybar i3-gaps gitui wdisplays chezmoi i3lock brave firefox grimshot ly wdisplays blueman-manager bluez bluez-utils pulseaudio-bluetooth meson scdoc wayland-protocols mpv feh dunst xclip bashtop ripgrep bat lsd yay pcmanfm unzip zip openconnect nitrogen git
# Install tmux plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
# Change default shell to zsh(needs reboot)
chsh -s $(which zsh)
# Vim plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
 https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
# Enable ly as default login manager
sudo systemctl enable ly.service

echo "SETUP FINISHED!"
echo "----------------------------------------------------------------"
echo "There are a couple of steps left:"

echo "1. install the plugins in nvim via nvim :pluginstall"
echo "2. Install the tmux plugins https://github.com/tmux-plugins/tpm#installing-plugins"
echo "3. Install fonts"
echo "4. Install lsp servers for neovim"
echo ""
echo "Used fonts: FontAwesome5(free), Fira Code, FantasqueSansMono NF"
echo "https://www.nerdfonts.com/"
echo "Wallpapers are from: https://wallhaven.cc"


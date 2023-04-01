## > Install and make yay
sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si

## > Install packages with yay
yay -S sway waybar kubectl brave swaybg swaylock-effects swayidle neovim polkit neofetch wlroots wayland-protocols pcre2 json-c pango cairo wdisplays xorg-xwayland dmenu tmux alacritty zsh curl wget docker tofi wdisplays grimshot bluez bluez-utils meson scdoc wayland-protocols mpv feh dunst xclip bashtop ripgrep bat lsd pcmanfm unzip zip openconnect git diff-so-fancy nitch nerd-fonts-agave ttf-font-awesome-5 dunstify

####################
## > Change default shell and install ohmyzsh
chsh -s $(which zsh) && zsh
####################
## > node management
# make cache folder (if missing) and take ownership
sudo mkdir -p /usr/local/n
sudo chown -R $(whoami) /usr/local/n
# make sure the required folders exist (safe to execute even if they already exist)
sudo mkdir -p /usr/local/bin /usr/local/lib /usr/local/include /usr/local/share
# take ownership of Node.js install destination folders
sudo chown -R $(whoami) /usr/local/bin /usr/local/lib /usr/local/include /usr/local/share
# download the n binary from git
curl -L https://raw.githubusercontent.com/tj/n/master/bin/n -o n
# install the lts
bash n lts
rm n
# now node and npm are available
npm install -g n
# install yarn through corepack
corepack prepare yarn@stable --activate
####################

####################
## > Install ohmyzsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install plugins
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
####################

####################
## > Set up rupa/z jump around
wget https://raw.githubusercontent.com/rupa/z/master/z.sh
sudo mv z.sh /opt
####################

####################
## > configs
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply skonky

####################
## > autostart sway in zsh session
echo "sway" >>~/.zprofile
####################

echo "SETUP FINISHED!"
echo "----------------------------------------------------------------"
echo "1. Install lsp servers for neovim"
echo "2. fix the wallpaper"
echo ""
echo "Used fonts: FontAwesome5(free), Agave Nerd Font"
echo "https://www.nerdfonts.com/"
echo "https://aur.archlinux.org/packages?K=nerd-fonts-&outdated=off"
echo "Wallpapers are from: https://wallhaven.cc"

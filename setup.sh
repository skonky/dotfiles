## > Install and make yay
sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si

## > Install packages with yay
# LOOK AT ALL THIS BLOAT LOL
yay -S sway base-devel waybar kubectl swaybg swaylock swayidle neovim polkit nitch neofetch wlroots wayland-protocols pcre2 json-c pango cairo wdisplays xorg-xwayland dmenu tmux alacritty zsh curl wget rofi gitui wdisplays brave neovide firefox grimshot ly wdisplays bluez bluez-utils pulseaudio-bluetooth meson scdoc wayland-protocols mpv feh dunst xclip bashtop ripgrep bat lsd pcmanfm unzip zip openconnect git diff-so-fancy

echo "Packages installed... finally..."

####################
## > Change default shell and install ohmyzsh
chsh -s $(which zsh) && zsh
# Install ohmyzsh
sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
# Install plugins and p10k
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
####################

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
echo "node, npm and yarn is installed"
####################

####################
## > Set up rupa/z jump around
cd /opt && wget https://raw.githubusercontent.com/rupa/z/master/z.sh
echo "rupa/z jump around installed!"
####################

####################
## > Install NvChad
echo "Removing nvim config, share and cache..."
rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim
rm -rf ~/.cache/nvim

mkdir -p ~/.config/nvim
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1
echo "nvim setup finished! (dont forget to install LSP servers and shit)"
####################

####################
## > configs
sh -c "$(curl -fsLS get.chezmoi.io)" --init --apply frank-selhorst
echo "chezmoi did it's thingy! (yay)"

####################

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

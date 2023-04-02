echo "*******CAUTION: there is no uninstaller ;)*********"
echo "*******CAUTION: Are you sure you want to proceed? *********"
# read input 
read -p "Enter: y(es) to proceed. (CTRL-D to exit)" choice

if [ "${choice,,}"  = 'y' ] || [ "${choice,,}"  = 'yes' ]; then
    install
  else
     echo "Exiting..."
  fi

function install() {
    ### > Install and make yay
    sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si

    ## > Install packages with yay
    yay -S sway waybar brave swaybg swaylock-effects swayidle neovim polkit neofetch nerdfetch wlroots wayland-protocols pcre2 json-c pango cairo wdisplays xorg-xwayland dmenu tmux alacritty zsh curl wget tofi wdisplays grimshot bluez bluez-utils meson scdoc wayland-protocols mpv feh dunst xclip bashtop ripgrep bat lsd pcmanfm unzip zip openconnect git diff-so-fancy nitch ttf-font-awesome-5 dunstify ttf-jetbrains-mono-nerd

    #####################
    ### > Change default shell 
    chsh -s $(which zsh) && zsh
    #####################
    ### > Node.js management
    ## make cache folder (if missing) and take ownership
    sudo mkdir -p /usr/local/n
    sudo chown -R $(whoami) /usr/local/n
    ## make sure the required folders exist (safe to execute even if they already exist)
    sudo mkdir -p /usr/local/bin /usr/local/lib /usr/local/include /usr/local/share
    ## take ownership of Node.js install destination folders
    sudo chown -R $(whoami) /usr/local/bin /usr/local/lib /usr/local/include /usr/local/share
    ## download the n binary from git
    curl -L https://raw.githubusercontent.com/tj/n/master/bin/n -o n
    ## install the lts
    bash n lts
    rm n
    ## now node and npm are available
    npm install -g n
    ## install yarn through corepack
    corepack prepare yarn@stable --activate
    #####################

    #####################
    ### > Set up rupa/z jump around
    wget https://raw.githubusercontent.com/rupa/z/master/z.sh
    sudo mv z.sh /opt
    #####################

    #####################
    ### > dot_config
    sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply skonky

    #####################
    ### > autostart sway in zsh session
    echo "sway" >>~/.zprofile
    #####################

    echo "All done!"
    echo "https://aur.archlinux.org/packages?K=nerd-fonts-&outdated=off"
    echo "https://wallhaven.cc"
}

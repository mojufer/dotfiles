if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Autostart sway
set -x XDG_SESSION_TYPE wayland
set -x XDG_CURRENT_DESKTOP sway
set -x MOZ_ENABLE_WAYLAND 1
set -x QT_QPA_PLATFORM wayland

# Aliases
alias brave="brave --enable-features=UseOzonePlatform --ozone-platform=wayland"
alias hssh="ssh -i /home/marco/.ssh/id_hezner_marco marco@188.245.36.178"
alias swayconfig="vim ~/.config/sway/config"
alias fishconfig="vim ~/.config/fish/config.fish"
alias sbb="cff"
alias neofetch="fastfetch"
alias nerd-font-installer='bash -c  "$(curl -fsSL https://raw.githubusercontent.com/officialrajdeepsingh/nerd-fonts-installer/main/install.sh)"'
alias plan="zathura ~/mojufer/eth/Revisions/plan.pdf"

thefuck --alias | source

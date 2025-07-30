# Autostart sway

if status is-interactive
    if test (tty) = "/dev/tty1"
        if not set -q WAYLAND_DISPLAY
            exec sway
        end
    end
end

set -x XDG_SESSION_TYPE wayland
set -x XDG_CURRENT_DESKTOP sway
set -x MOZ_ENABLE_WAYLAND 1
set -x QT_QPA_PLATFORM wayland

# Mode ta gueule
set fish_greeting ""

# Aliases
alias brave="brave --enable-features=UseOzonePlatform --ozone-platform=wayland"
alias hssh="ssh -i /home/marco/.ssh/id_hezner_marco marco@188.245.36.178"
alias swayconfig="vim ~/.config/sway/config"
alias fishconfig="vim ~/.config/fish/config.fish"
alias sbb="cff"
alias neofetch="fastfetch"
alias nerd-font-installer='bash -c  "$(curl -fsSL https://raw.githubusercontent.com/officialrajdeepsingh/nerd-fonts-installer/main/install.sh)"'
alias plan="zathura ~/mojufer/eth/Revisions/plan.pdf"
alias powerstats="auto-cpufreq --stats"
alias sl="ls"
alias l="ls"
alias s="ls"
alias lst="ls -lhst"
alias vimconfig="vim ~/.vimrc"

thefuck --alias | source




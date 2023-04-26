_: {
  home.shellAliases = {
    "dev" = "nix develop $HOME/.config/nix/";
    # Clear
    "c" = "clear";
    "clwer" = "clear";
    "cc" = "clear";
    "cear" = "clear";
    "cler" = "clear";
    "clea" = "clear";
    "clar" = "clear";
    "clewar" = "clear";
    "lear" = "clear";
    "celra" = "clear";
    "clera" = "clear";
    "claer" = "clear";
    "celar" = "clear";
    "clare" = "clear";

    # Tool enhancement
    "vim" = "nvim";
    "cp" = "cp -i";
    "df" = "df -h";
    "grep" = "grep --color";
    "ls" = "ls --color";
    "mkdir" = "mkdir -pv";

    # Sudo
    "usermod" = "sudo usermod";
    "chmod" = "sudo chmod";
    "chown" = "sudo chown";
    "dhcpcd" = "sudo dhcpcd";

    # Useful
    "cpssh" = "gpg --export-ssh-key frontendmonster@gmail.com | xsel -i --clipboard";
    "gpgreload" = "gpg-connect-agent reloadagent /bye";
    "x" = "sudo chmod +x";
    "path" = "echo \${PATH//:/\\\\n} | sort";
    "fpath" = "$fpath | tr ' ' '\n' | sort";
    "findstr" = "grep -rnw";
    "afind" = "ack -il";
    "cpwd" = "pwd | xsel -i --clipboard";
    "clocksync" = "sudo ntpdate 1.ro.pool.ntp.org";
    "fuck" = "killall -9";
    ":q" = "exit";
    "lsa" = "ls -AF --group-directories-first";
    "lless" = "l | less";
    "laless" = "ll | less";
    "rd" = "rmdir";
    "open" = "xdg-open";
    "sskey" = "screenkey -t 2 -s small --vis-shift &>/dev/null &";
    "genpass" = "openssl rand -base64 32";

    # Network
    "down" = "nmcli c down";
    "up" = "nmcli c up";
    "connect" = "nmcli device wifi connect";
    "getip" = "curl -s -S https://icanhazip.com";
    "mac" = "$WIFI_ADAPTOR";
    "ping" = "getMac ping -i 1 -O";
    "scanip" = "nmap -sn 192.168.1.0/24";

    # CURL
    "GET" = "curl -X GET \"content-type: application/json\"";
    "POST" = "curl -X POST \"content-type: application/json\"";
    "PUT" = "curl -X PUT \"content-type: application/json\"";
    "PATCH" = "curl -X PATCH \"content-type: application/json\"";
    "DELETE" = "curl -X DELETE \"content-type: application/json\"";

    # Configs
    "hosts" = "sudoedit /etc/hosts";
    "dnsrc" = "sudoedit /etc/resolv.conf";
    "historyrc" = "$EDITOR $HOME/.local/share/history";
    "bookmarkrc" = "$EDITOR $HOME/.config/bookmarkrc";
    "profilerc" = "$EDITOR $HOME/.profile";
    "bashrc" = "$EDITOR $HOME/.bashrc";
    "sshrc" = "$EDITOR $HOME/.ssh/config";
    "gitrc" = "$EDITOR $XDG_CONFIG_HOME/git/config";
    "mocrc" = "$EDITOR $XDG_CONFIG_HOME/moc/config";
    "zshrc" = "$EDITOR $XDG_CONFIG_HOME/zsh/.zshrc";
    "vimrc" = "$EDITOR $XDG_CONFIG_HOME/nvim";
    "vimplug" = "$EDITOR $XDG_CONFIG_HOME/nvim/plugins.vim";
    "tmuxrc" = "$EDITOR $XDG_CONFIG_HOME/tmux/tmux.conf";
    "rangerrc" = "$EDITOR $XDG_CONFIG_HOME/ranger";
    "alacrittyrc" = "$EDITOR $XDG_CONFIG_HOME/alacritty";
    "i3rc" = "$EDITOR $XDG_CONFIG_HOME/i3/config";
    "polybarrc" = "$EDITOR $XDG_CONFIG_HOME/polybar/config.ini";
    "fontrc" = "$EDITOR $XDG_CONFIG_HOME/fontconfig";
    "gpgrc" = "$EDITOR $GNUPGHOME/gpg-agent.conf";
    "xinitrc" = "$EDITOR $XDG_CONFIG_HOME/X11/xinitrc";
    "sxrc" = "$EDITOR $XDG_CONFIG_HOME/sxhkd/sxhkdrc";
    "xreload" = "$EDITOR $XDG_CONFIG_HOME/X11/Xresources";
    "resx" = "pkill sxhkd; sxhkd &";

    # Docker
    "dc" = "docker-compose";
    "dcd" = "docker-compose -f ./docker-compose.dev.yml";
    "drmi" = "$(docker images -a --filter=dangling=true -q) 2>/dev/null";
    "drm" = "$(docker ps --filter=status=exited --filter=status=created -q) 2>/dev/null";
    "dps" = "docker ps -a";
    "dim" = "docker images | tail -n +2 | sort";

    # Git
    "gdebug" = "git add . && git commit -m \"debug\" --no-verify && git push";
    "gdebug!" = "git add . && git commit --amend --no-edit --no-verify && git push -f --force-with-lease";
    "clone" = "git clone";
    "gs" = "git status -s";
    "gss" = "git status";
    "gsl" = "git stash list";
    "gf" = "git fetch";
    "gfp" = "git fetch --prune";
    "ga" = "git add";
    "gaa" = "git add . && git status -s";
    "gb" = "git branch -v";
    "gbr" = "git branch --remote";
    "gba" = "git branch -a";
    "gbd" = "git branch -d";
    "gbD" = "git branch -D";
    "gc" = "git commit -v";
    "gca" = "git commit --amend";
    "gc!" = "git commit -v --amend --no-edit";
    "gcam" = "git commit -a -m";
    "gcm" = "git commit -m";
    "gsw" = "git switch";
    "gswc" = "git switch -c";
    "gswd" = "git switch dev && git pull";
    "gwip" = "git wip";
    "gco" = "git checkout";
    "pull" = "git pull";
    "push" = "git push";
    "push!" = "git push origin --force --no-force-with-lease";
    "gcount" = "git shortlog -sn";
    "gl" = "git log --oneline --decorate";
    "glog" = "git lg2 | emojify | less -r";
    "gloga" = "git lg | emojify | less -r";
    "gls" = "git log --stat";
    "gma" = "git merge --abort";
    "gr" = "git reset";
    "gra" = "git reset .";
    "grh" = "git reset HEAD";
    "grhh" = "git reset HEAD --hard";
    "grrm" = "git remote remove";
    "grv" = "git remote -v";
    "gro" = "git remote add origin";
    "groot" = "git commit -m 'root' --allow-empty";
    "grb" = "git rebase";
    "grba" = "git rebase --abort";
    "grbc" = "git rebase --continue";
    "grbs" = "git rebase --skip";
    "grbi" = "git rebase -i";
    "gt" = "git tag";
    "gtv" = "git tag | sort -V";
    "count-line" = "git total --numstat -- . \":(exclude)package-json.lock\"";
    "gdc" = "gd --cached";
  };
}

FROM archlinux

RUN echo '[multilib]' >> /etc/pacman.conf && \
    echo 'Include = /etc/pacman.d/mirrorlist' >> /etc/pacman.conf && \
    pacman --noconfirm -Syyu && \
    pacman --noconfirm -S base-devel git && \
    groupadd --gid 1000 glen && \
    useradd --uid 1000 --gid 1000 -m -r -s /bin/bash glen && \
    passwd -d glen && \
    echo 'glen ALL=(ALL) ALL' > /etc/sudoers.d/glen && \
    mkdir -p /home/glen/.gnupg && \
    echo 'standard-resolver' > /home/glen/.gnupg/dirmngr.conf && \
    chown -R glen:glen /home/glen && \
    mkdir /build && \
    chown -R glen:glen /build && \
    cd /build && \
    sudo -u glen git clone --depth 1 https://aur.archlinux.org/paru.git && \
    cd paru && \
    sudo -u glen makepkg --noconfirm -si && \
    sed -i 's/#RemoveMake/RemoveMake/g' /etc/paru.conf && \
    pacman -Qtdq | xargs -r pacman --noconfirm -Rcns && \
    rm -rf /home/glen/.cache && \
    rm -rf /build

USER glen


RUN sudo -u glen paru --noconfirm --skipreview --useask -S \
      atuin \
      aws-cli \
      packer \
      terraform \
      kubectl \
      k9s \
      bat \
      cargo \
      direnv \
      dua-cli \
      dust \
      duf \
      fd \
      github-cli \
      gitui \
      htop \
      lf-bin \
      linux-headers \
      man-db \
      man-pages \
      neofetch \
      neovim-nightly-bin \
      neovim-plug-git \
      nvm-git \
      npm \
      pacman-contrib \
      pyenv \
      ripgrep \
      starship \
      tldr \
      tmux \
      tree \
      unzip \
      viddy \
      just \
      delta \
      entr \
      zsh \
      zsh-autosuggestions \
      zsh-history-substring-search \
      zsh-syntax-highlighting \
      zsh-vi-mode-git && \
      pacman -Qtdq | xargs -r pacman --noconfirm -Rcns && \
      paccache -rk0 && \
      rm -rf /home/glen/.cache

WORKDIR /home/glen


WORKDIR /home/
CMD ["zsh"]



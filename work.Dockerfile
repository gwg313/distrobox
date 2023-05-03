FROM devtainer_base

RUN sudo -u glen paru --noconfirm --skipreview --useask -S \
      ansible \
      argocd \
      aws-cli \
      eksctl \
      helm \
      jq \
      k9s \
      kind \
      kubectl \
      kubectx \
      kubens \
      packer \
      python-j2cli \
      terraform \
      ts-node

CMD ["zsh"]

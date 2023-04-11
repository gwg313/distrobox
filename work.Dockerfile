FROM devtainer_base

RUN sudo -u glen paru --noconfirm --skipreview --useask -S \
      ansible \
      aws-cli \
      eksctl \
      jq \
      k9s \
      kubectl \
      kubectx \
      kubens \
      packer \
      terraform \
      ts-node \

CMD ["fish"]

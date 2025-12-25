FROM ubuntu

RUN apt-get update && apt-get install -y curl direnv
RUN sh -c "$(curl -fsLS get.chezmoi.io)"
RUN curl -sSO https://starship.rs/install.sh && chmod +x install.sh && ./install.sh -y

COPY ./age.key /root/.config/chezmoi/age.key

WORKDIR /root

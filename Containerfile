FROM mcr.microsoft.com/devcontainers/typescript-node:latest

RUN apt-get update
RUN apt-get install -y fastfetch zsh vim tmux ripgrep fd-find fzf lf zsh-syntax-highlighting zsh-autosuggestions git curl openssh-client sudo lazygit tzdata locales
RUN apt-get clean

ENV TZ=America/New_York

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN ln -sf /usr/bin/fdfind /usr/local/bin/fd

RUN curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
RUN tar -C /opt -xzf nvim-linux-x86_64.tar.gz
RUN ln -sf /opt/nvim-linux-x86_64/bin/nvim /usr/local/bin/nvim
RUN rm nvim-linux-x86_64.tar.gz

RUN sh -c "$(curl -fsLS get.chezmoi.io)" -- -b /usr/local/bin

RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && locale-gen

ENV LANG=C.UTF-8
ENV LC_ALL=C.UTF-8

ENV TERM=xterm-256-color256

# RUN useradd -m -s /usr/bin/zsh user
# RUN echo "user ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Set the default shell for the user and environment
ENV SHELL=/usr/bin/zsh

# USER user
WORKDIR /root

# Setup default directories
# RUN mkdir -p /home/user/.local/bin

# Keep the container running in the background
CMD ["tail", "-f", "/dev/null"]

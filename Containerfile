FROM mcr.microsoft.com/devcontainers/typescript-node:latest

RUN apt-get update
RUN apt-get install -y fastfetch zsh vim tmux ripgrep fd-find fzf lf zsh-syntax-highlighting zsh-autosuggestions git curl openssh-client sudo lazygit
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

RUN sh -c "$(curl -fsLS get.chezmoi.io)" -- -b /usr/local/bin

RUN ln -sf /usr/bin/fdfind /usr/local/bin/fd

RUN curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
RUN tar -C /opt -xzf nvim-linux-x86_64.tar.gz
RUN ln -sf /opt/nvim-linux-x86_64/bin/nvim /usr/local/bin/nvim
RUN rm nvim-linux-x86_64.tar.gz

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

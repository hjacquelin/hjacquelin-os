# On part de l'image officielle de Fedora Silverblue
FROM quay.io/fedora-ostree-desktops/silverblue:43

# Suppression de Firefox pré-installé
RUN rpm-ostree override remove firefox firefox-langpacks

# On ajoute les paquets
RUN rpm-ostree install \
    zoxide \
    btop \
    gnome-tweaks \
    distrobox \
    gh \
    vim \
    fastfetch \
    && rpm-ostree cleanup -m

# On installe eza
RUN curl -L https://github.com/eza-community/eza/releases/latest/download/eza_x86_64-unknown-linux-gnu.tar.gz | tar -xz && \
    mv eza /usr/bin/eza && \
    chmod +x /usr/bin/eza

# On ajoute les scripts
RUN mkdir -p /usr/local/bin
COPY local_files/scripts/install-toolbox.sh /usr/local/bin/install-toolbox
RUN chmod +x /usr/local/bin/install-toolbox


COPY local_files/fonts/ /usr/share/fonts/
COPY local_files/bashrc_custom /etc/profile.d/custom_vars.sh

RUN fc-cache -f

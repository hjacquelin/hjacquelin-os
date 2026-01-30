# On part de l'image officielle de Fedora Silverblue
FROM quay.io/fedora-ostree-desktops/silverblue:43

# Suppression de Firefox pré-installé
RUN rpm-ostree override remove firefox firefox-langpacks

# On ajoute les paquets
RUN rpm-ostree install \
    zoxide \
    eza \
    btop \
    gnome-tweaks \
    distrobox \
    gh \
    vim \
    fastfetch \
    && rpm-ostree cleanup -m

COPY local_files/fonts/ /usr/share/fonts/
COPY local_files/bashrc_custom /etc/profile.d/custom_vars.sh

RUN fc-cache -f

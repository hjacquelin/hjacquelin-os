# On part de l'image officielle de Fedora Silverblue
FROM quay.io/fedora-ostree-desktops/silverblue:43

# Suppression de Firefox pré-installé
RUN rpm-ostree override remove firefox firefox-langpacks

# On ajoute les paquets
RUN rpm-ostree install \
    distrobox \
    gh \
    vim \
    fastfetch \
    && rpm-ostree cleanup -m

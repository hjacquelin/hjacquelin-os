# On part de l'image officielle de Fedora Silverblue
FROM quay.io/fedora-ostree-desktops/silverblue:43

# On ajoute les paquets
RUN rpm-ostree install \
    distrobox \
    gh \
    vim \
    fastfetch \
    && rpm-ostree cleanup -m

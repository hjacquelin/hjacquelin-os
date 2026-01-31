#!/bin/bash
# Script pour installer JetBrains Toolbox proprement sur un OS Atomic

echo "🚀 Récupération de la dernière version de JetBrains Toolbox..."

# Trouver l'URL de téléchargement direct
URL=$(curl -s 'https://data.services.jetbrains.com/products/releases?code=TBA&latest=true&type=release' | jq -r '.TBA[0].downloads.linux.link')

if [ -z "$URL" ]; then
    echo "❌ Erreur : Impossible de trouver l'URL de téléchargement."
    exit 1
fi

# Téléchargement et extraction
mkdir -p /tmp/toolbox
curl -L "$URL" | tar -xz -C /tmp/toolbox --strip-components=1

# Exécution de l'installateur (Toolbox s'installe par défaut dans ~/.local/share/JetBrains)
echo "📦 Lancement de l'installateur..."
/tmp/toolbox/jetbrains-toolbox

echo "✅ Terminé ! Tu peux maintenant lancer la Toolbox depuis ton menu d'applications."
rm -rf /tmp/toolbox

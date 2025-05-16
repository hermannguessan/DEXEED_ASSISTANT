#!/bin/bash

# Nom du dépôt GitHub
REPO_URL="https://github.com/hermannguessan/DEXEED_ASSISTANT.git"

# Nom de la branche principale
BRANCH="main"

# Nom du commit initial
COMMIT_MSG="Déploiement automatique"

# Vérifie si git est installé, sinon l'installe
if ! command -v git &> /dev/null; then
    echo "🔧 Git n'est pas installé. Installation en cours..."
    sudo apt update && sudo apt install -y git
    if [ $? -ne 0 ]; then
        echo "❌ Échec de l'installation de Git. Abandon."
        exit 1
    fi
else
    echo "✅ Git est déjà installé."
fi

# Initialise le dépôt
echo "📁 Initialisation du dépôt Git..."
git init

# Ajoute tous les fichiers
echo "➕ Ajout des fichiers..."
git add .

# Commit
echo "✅ Commit..."
git commit -m "$COMMIT_MSG"

# Branche principale
git branch -M $BRANCH

# Ajout du dépôt distant
echo "🔗 Lien avec le dépôt distant..."
git remote add origin "$REPO_URL"

# Push vers GitHub
echo "🚀 Envoi vers GitHub..."
git push -u origin $BRANCH

echo "🎉 Déploiement terminé avec succès !"

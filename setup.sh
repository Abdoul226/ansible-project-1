#!/bin/bash

echo "🔧 Initialisation du projet Ansible..."

if ! command -v ansible &> /dev/null
then
    echo "⚠️ Ansible n'est pas installé. Installation en cours..."
    sudo apt update && sudo apt install -y ansible
else
    echo "✅ Ansible est déjà installé."
fi

if [ ! -f inventory/hosts.ini ]; then
    echo "❌ Fichier d'inventaire introuvable : inventory/hosts.ini"
    exit 1
fi

echo "📋 Hôtes configurés dans l'inventaire :"
grep -v '^#' inventory/hosts.ini | grep -Eo '^[a-z]+\[.*\]|^[0-9.]+' | sed '/^$/d'

echo "✅ Projet prêt à être utilisé. Utilisez 'make web', 'make db' ou 'make all'."

# 📦 Ansible Project

## 🧾 Description

Ce projet Ansible déploie automatiquement :

- Un serveur **Apache** sur une machine `web`
- Un serveur **MariaDB** sur une machine `db`

Il est conçu pour être utilisé dans un environnement Vagrant avec des machines Ubuntu 22.04.

---

## 🗂️ Structure du projet

```
ansible-project/
├── inventory/               # Fichier d'inventaire Ansible
│   └── hosts.ini
├── playbooks/               # Playbooks Ansible
│   ├── web-setup.yml
│   └── db-setup.yml
├── group_vars/
│   └── all.yml              # Variables globales
├── vars/
│   └── db.yml               # Variables sensibles (ex: mot de passe MariaDB)
├── Makefile                 # Raccourcis de commandes
├── setup.sh                 # Script d'initialisation du projet
└── README.md                # Documentation du projet
```

---

## ⚙️ Prérequis

- Ansible (installé via `setup.sh` ou manuellement)
- Accès SSH aux machines Vagrant
- Clé privée SSH Vagrant pour chaque machine (`.vagrant.d/insecure_private_key`)

---

## 🚀 Lancer le projet

### 1. Initialisation

```bash
chmod +x setup.sh
./setup.sh
```

### 2. Lancer les playbooks

```bash
make web   # Configure le serveur Apache
make db    # Configure le serveur MariaDB
make all   # Configure les deux serveurs
```

---

## 🧠 Contenu des playbooks

### `web-setup.yml`

- Installe Apache (`apache2`)
- Active le service
- Déploie une page HTML dynamique avec :
  - le nom de la machine
  - la date et l'heure du déploiement
  - un logo Apache

### `db-setup.yml`

- Installe MariaDB (`mariadb-server`)
- Définit un mot de passe root
- Active le service

---

## 🌐 Accès aux services

- Apache (web) : http://192.168.33.10
- MariaDB (db) : sur 192.168.33.11:3306 (port par défaut en local)

---

## 🔐 Sécurité

- Le mot de passe root MariaDB est défini dans `vars/db.yml`. Pensez à le chiffrer avec `ansible-vault` si besoin :

```bash
ansible-vault encrypt vars/db.yml
```

---

## 🛠️ Personnalisation

- Vous pouvez ajouter d'autres rôles dans le dossier `roles/`
- Les variables peuvent être séparées par groupe ou hôte

---

## 📌 Auteur

Projet Ansible réalisé par Abdoul-Aziz.

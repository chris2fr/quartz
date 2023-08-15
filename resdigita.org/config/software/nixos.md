---
title: "NixOS"
date: 2023-08-15
---

J'utilise le dépôt suivant :

https://github.com/chris2fr/nixops/

Je fais un checkout dans le dossier root du serveur sous /root/nixos. 

Ensuite 

```
cd /root
ssh-keygen # si ce n'est pas fait
cat .ssh/id_rsa.pub # pour mettre dans https://github.com/chris2fr/nixops/settings/keys
nix-shell -p git # Si git n'est pas installé par défaut 
git clone git@github.com:chris2fr/nixops.git
mv /etc/nixos{,.orig} # Déplace le nixos d'origine
ln -s /root/nixops/stage /etc/nixos # remplacer "stage" par le nom du serveur
nixos-rebuild switch --upgrade # Migrer le serveur
```

Voici un commande intéressante qui liste tous les états du système: `nix-env --list-generations --profile /nix/var/nix/profiles/system`
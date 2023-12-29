---
title: Configuration de courriels (SMTP et IMAP)
---


Voici sa configuration manuelle SMTP

| Paramètre | Valeur |
| --- | --- |
| serveur SMTP | mail.lesgrandsvoisins.com |
| port SMTP | 587 | 
| StartTLS | OUI (le chiffrement est géré à ce niveau) |
| SSL | NON | 
| Login | vous@lesgrandsvoisins.com  (ou une boîte courrielle gérée sur nos serveurs comme @resdigita.com ou similaire) | 
| Passe | [Votre mot de passe] |

Voici sa configuration manuelle IMAP

| Paramètre | Valeur |
| --- | --- |
| serveur IMAP | mail.lesgrandsvoisins.com |
| port IMAP | 143 | 
| StartTLS | OUI |
| SSL | NON | 
| Login | vous@lesgrandsvoisins.com  (ou une boîte courrielle gérée sur nos serveurs) | 
| Passe | [Votre mot de passe] |

Nous pourrions mettre en place une auto-configuration prochainement. 

Le compte est géré sur [app.lesgrandsvoisins.com](https://app.lesgrandsvoisins.com)

## A faire (to do)

- [ ] Mettre en place un système de transfert de courriels
	- [x] Mise en place des renvois statics depuis NixOS dans services.ostfix.virtual
	- [ ] Mise en place des forwards dans LDAP
	- [ ] Mettre en place un interface dans Guichet pour la gestion des transferts
- [ ] Penser à mettre en place un quota du nombre de BAL à créer puis du volume par BAL en Go. 
- [ ] Penser à proposer des usages d'alias au lieu de créer un compte distincte par utilisateur.
---
title: "Mail.LesGrandsVoisins.Com"
date: 2023-07-31
enableToc: false
---

[Mail.LesGrandsVoisins.Com](https://mail.lesgrandsvoisins.com) permet trois choses: 

1. C'est un serveur d'infrastructure publique de courriels (selon les protocoles dit SMTP et IMAP).
2. C'est un accès à une application web pour la gestion des courriels, des calendriers et des contacts

## Configuration de votre client de courriel

[!Note] Actuellement on lit ci-dessous "mail.resdigita.com", mais ceci sera remplacé par "mail.lesgrandsvoisins.com" dans un avenir.

Mail.ResDigita.Com est un serveur public SMTP des Grands Voisins. Il est utilisé par plusieurs services, dont toutes nos applications internes, notre serveur de mailings et notre application de courriel, de calendriers et de contacts sur [mail.lesgrandsvoisins.com](https://mail.resdigita.com).

Voici sa configuration manuelle SMTP

| Paramètre | Valeur |
| --- | --- |
| serveur SMTP | mail.resdigita.com |
| port SMTP | 25 | 
| StartTLS | OUI (le chiffrement est géré à ce niveau) |
| SSL | NON | 
| Login | vous@lesgrandsvoisins.com  (ou une boîte courrielle gérée sur nos serveurs) | 
| Passe | [Votre mot de passe] |

Voici sa configuration manuelle IMAP

| Paramètre | Valeur |
| --- | --- |
| serveur IMAP | mail.resdigita.com |
| port IMAP | 143 | 
| StartTLS | OUI |
| SSL | NON | 
| Login | vous@lesgrandsvoisins.com  (ou une boîte courrielle gérée sur nos serveurs) | 
| Passe | [Votre mot de passe] |

Nous pourrions mettre en place une auto-configuration prochainement. 

Le compte est géré sur [app.lesgrandsvoisins.com](https://app.lesgrandsvoisins.com)

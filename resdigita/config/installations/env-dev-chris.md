apt install slapd

admin password
jasff2852198342hjweqf

apt install slapd

admin password
jasff2852198342hjweqf

## Pour mettre un mot de passe

Utiliser la commande `slappasswd` pour générer un mot de passe. Cela donne quelque chose comme `{SSHA}sOPuOKzAYUSkK8yGm7LLjkfajoD6QdP+`.

On crée un fichier `mod.ldif` avec le content suivant.

```
dn: cn=admin,dc=resdigita,dc=com
changeType: add
add: userPassword
userPassword: {SSHA}sOPuOKzAYUSkK8yGm7LLjkfajoD6QdP+
```

Ensuite faire la commande `ldapmodify -l mod.ldif`

Le processus est à répéter pour `dn: cn=alice@resdigita.org,ou=users,dc=resdigita,dc=org`, `dn: cn=bob@resdigita.org,ou=users,dc=resdigita,dc=org`, `cn=newuser@lesgv.com,ou=users,dc=resdigita,dc=org`

## Pour JXplorer


http://jxplorer.org/


![[jxplorer-cxn.png]]

## Pour Guichet

Mettre en place un document `config.json` sur la base de `config.json.exemple` un peu comme suite.

### Cloner le code source

Cloner le code source depuis [https://github.com/chris2fr/guichet](https://github.com/chris2fr/guichet)

```
cd
git clone git@github.com:chris2fr/guichet.git
cd guichet 
cp config.json{.exemple,}
nano config.json
```

Le fichier config.json devrait à la fin ressembler un peu à ceci:

```
{
  "http_bind_addr": ":9991",
  "ldap_server_addr": "mail.lesgrandsvoisins.com",
  "ldap_tls": true,

  "base_dn": "dc=resdigita,dc=org",
  "user_base_dn": "ou=users,dc=resdigita,dc=org",
  "user_name_attr": "cn",
  "group_base_dn": "ou=groups,dc=resdigita,dc=org",
  "group_name_attr": "cn",

  "invitation_base_dn": "ou=invitations,dc=resdigita,dc=org",
  "invitation_name_attr": "uid",
  "invited_mail_format": "{}",
  "invited_auto_groups": [],

  "web_address": "https://localhost:9991",
  "mail_from": "contact@lesgrandsvoisins.com",
  "mail_from_full_name": "Contact App.LesGrandsVoisins.Com",
  "smtp_server": "mail.lesgrandsvoisins.com",
  "smtp_username": "contact@lesgrandsvoisins.com",
  "smtp_password": "[Mettree un password ici]",

  "admin_account": "cn=chris,ou=users,dc=resdigita,dc=org",
  "group_can_admin": "cn=administration,ou=groups,dc=resdigita,dc=org",
  "group_can_invite": "cn=invitation,ou=groups,dc=resdigita,dc=org",

  "mailing_list_base_dn": "ou=mailings,dc=resdigita,dc=org",
  "mailing_list_name_attr": "cn",
  "mailing_list_guest_user_base_dn": "ou=mailings,dc=resdigita,dc=org",

  "org": "LesGrandsVoisins.Com",
  "domain_name": "guichet.lesgrandsvoisins.com",
  "new_user_dn": "cn=newuser@lesgv.com,ou=users,dc=resdigita,dc=org",
  "new_user_password": "[Mettree un password ici]",
  "new_users_base_dn": "ou=users,dc=resdigita,dc=org",
  "new_user_default_domain": "lesgrandsvoisins.com"
}
```

Faites attention à `web_address` qui peut être différent. Penser aussi à modifier `[Mettree un password ici]`. newuser@lesgv.com devrait avoir un mot de passe connu dans ce fichier. (Voir modifier mot de passe).

### Compilier Guichet

Faire `make` depuis le dossier de checkout

### Utilisateur spécifique 

Il peut être avantageux de créer un utilisateur spécifique pour Guichet. `newuser guichet`. Dans ce cas, il convient de faire le clone et exécution depuis le dossier utilisateur. 

## Dépendances

Penser à installer les packages suivants :

- slapd
- golang

## Faire marcher SystemD sous WSL

WSL2 dans une version récente permet systemd . Pour le faire marcher, il convient de créer un fichier `/etc/wsl2.conf` avec le contenu suivant :

```
[boot]
systemd=true
```
## Pour Obsidian

https://obsidian.md/

Ouvrir un coffre fort dans le dossier Resdigita
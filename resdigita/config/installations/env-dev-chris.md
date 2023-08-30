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

Le processus est à répéter pour 

## Pour JXplorer


![[jxplorer-cxn.png]]
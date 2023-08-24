---
title: "Migrer le serveur mel de VPS à Hetzner 005"
date: 2023-08-16
---

Current mail server: [[config/domains/lesgrandsvoisins.com/mail]]  
New mail server: [[config/domains/gvois.in/mail]]

Current MX records   
gvois.in MX mail.gvois.in     
lesgrandsvoisins.com MX mail.lesgrandsvoisins.com  

Transition MX records   
gvois.in MX mail.gvois.in     
lesgrandsvoisins.com MX mail.gvois.in     

End MX Records  
lesgrandsvoisins.com MX mail.gvois.in     
vpsfreecz001.lesgrandsvoisins.com MX vpsfreecz001.lesgrandsvoisins.com  
lesgrandsvoisins.com MX mail.lesgrandsvoisins.com  
gvois.in MX vpsfreecz001.lesgrandsvoisins.com

## Step 1

Create a test account

test@lesgrandsvoisins.com   
jfaf982325ffasNNDF==

https://app.lesgrandsvoisins.com

Send and receive email from said account.

>[!bug] Correct login
>Please note that currently one logs in with test instead of test@lesgrandsvoisins.com.
>TODO

DONE 2023-08-16
## Step 2

Export LDAP from [[config/software/openldap]] for unlisted ldap entries in [[config/servers/hetzner005]] from [[config/servers/vpsfreecz001]].

### On  vpsfreecz001 (source)

```
[root@vpsfreecz001:~/nixops]# ldapsearch -H ldap:/// -D "cn=admin,dc=resdigita,dc=org" -y /root/nixops/vpsfreecz001/.secrets.bind -b "dc=resdigita,dc=org" dn | grep ^dn:
dn: dc=resdigita,dc=org
dn: ou=users,dc=resdigita,dc=org
dn: ou=groups,dc=resdigita,dc=org
dn: ou=mailings,dc=resdigita,dc=org
dn: ou=newusers,dc=resdigita,dc=org
dn: ou=invitations,dc=resdigita,dc=org
dn: cn=list,ou=users,dc=resdigita,dc=org
dn: cn=Odoo,ou=users,dc=resdigita,dc=org
dn: cn=test,ou=users,dc=resdigita,dc=org
dn: cn=hvkhyn,ou=users,dc=resdigita,dc=org
dn: cn=thomas,ou=users,dc=resdigita,dc=org
dn: cn=Hasaera,ou=users,dc=resdigita,dc=org
dn: cn=Maelanc,ou=users,dc=resdigita,dc=org
dn: cn=daphnedubois,ou=users,dc=resdigita,dc=org
dn: cn=siZaVhvEFMqn,ou=users,dc=resdigita,dc=org
dn: cn=RajyUrKdEHJZogG,ou=users,dc=resdigita,dc=org
dn: cn=yellowmorgan1967,ou=users,dc=resdigita,dc=org
dn: cn=bob@resdigita.org,ou=users,dc=resdigita,dc=org
dn: cn=newuser@lesgv.com,ou=users,dc=resdigita,dc=org
dn: cn=sogo@resdigita.org,ou=users,dc=resdigita,dc=org
dn: cn=alice@resdigita.org,ou=users,dc=resdigita,dc=org
dn: cn=sviatlanaviarbitskaya,ou=users,dc=resdigita,dc=org
dn: cn=chris@lesgrandsvoisins.com,ou=users,dc=resdigita,dc=org
dn: cn=contact@lesgrandsvoisins.com,ou=users,dc=resdigita,dc=org
dn: cn=denisdecastro@lesgrandsvoisins.com,ou=users,dc=resdigita,dc=org
dn: ou=apps,ou=groups,dc=resdigita,dc=org
dn: cn=invitation,ou=groups,dc=resdigita,dc=org
dn: cn=administration,ou=groups,dc=resdigita,dc=org
dn: cn=mail,ou=apps,ou=groups,dc=resdigita,dc=org
dn: uid=test,ou=invitations,dc=resdigita,dc=org
dn: uid=hvkhyn,ou=invitations,dc=resdigita,dc=org
dn: uid=thomas,ou=invitations,dc=resdigita,dc=org
dn: uid=Hasaera,ou=invitations,dc=resdigita,dc=org
dn: uid=Maelanc,ou=invitations,dc=resdigita,dc=org
dn: uid=siZaVhvEFMqn,ou=invitations,dc=resdigita,dc=org
dn: uid=yellowmorgan1967,ou=invitations,dc=resdigita,dc=org
```

### On Hetzner005 (destination)

```
[root@lesgrandsvoisins:~/nixops]# ldapsearch -H ldap:/// -D "cn=admin,dc=resdigita,dc=org" -y /root/nixops/hetzner/.secrets.bind  -b "dc=resdigita,dc=org" dn | grep ^dn:
dn: dc=resdigita,dc=org
dn: ou=users,dc=resdigita,dc=org
dn: ou=mailings,dc=resdigita,dc=org
dn: ou=groups,dc=resdigita,dc=org
dn: ou=invitations,dc=resdigita,dc=org
dn: cn=alice@resdigita.org,ou=users,dc=resdigita,dc=org
dn: cn=bob@resdigita.org,ou=users,dc=resdigita,dc=org
dn: cn=sogo@resdigita.org,ou=users,dc=resdigita,dc=org
dn: cn=newuser@lesgv.com,ou=users,dc=resdigita,dc=org
```

We are in luck since the destination LDAP is empty.  Let me do the reset.

```
[root@vpsfreecz001:~/nixops]# scp slapcat-vpsfreecz001-202308160.ldif gvois.in:
[root@lesgrandsvoisins:~]# slapadd -F /etc/openldap/slapd.d/ -l slapcat-vpsfreecz001-202308160.ldif -c
[root@lesgrandsvoisins:~]# ldapsearch -H ldap:/// -D "cn=admin,dc=resdigita,dc=org" -y /root/nixops/hetzner/.secrets.bind  -b "dc=resdigita,dc=org" dn | grep ^dn:
dn: dc=resdigita,dc=org
dn: ou=users,dc=resdigita,dc=org
dn: ou=mailings,dc=resdigita,dc=org
dn: ou=groups,dc=resdigita,dc=org
dn: ou=invitations,dc=resdigita,dc=org
dn: cn=alice@resdigita.org,ou=users,dc=resdigita,dc=org
dn: cn=bob@resdigita.org,ou=users,dc=resdigita,dc=org
dn: cn=sogo@resdigita.org,ou=users,dc=resdigita,dc=org
dn: cn=newuser@lesgv.com,ou=users,dc=resdigita,dc=org
dn: cn=chris@lesgrandsvoisins.com,ou=users,dc=resdigita,dc=org
dn: cn=denisdecastro@lesgrandsvoisins.com,ou=users,dc=resdigita,dc=org
dn: cn=invitation,ou=groups,dc=resdigita,dc=org
dn: ou=newusers,dc=resdigita,dc=org
dn: cn=administration,ou=groups,dc=resdigita,dc=org
dn: cn=thomas,ou=users,dc=resdigita,dc=org
dn: cn=sviatlanaviarbitskaya,ou=users,dc=resdigita,dc=org
dn: uid=thomas,ou=invitations,dc=resdigita,dc=org
dn: cn=contact@lesgrandsvoisins.com,ou=users,dc=resdigita,dc=org
dn: cn=list,ou=users,dc=resdigita,dc=org
dn: cn=Odoo,ou=users,dc=resdigita,dc=org
dn: cn=daphnedubois,ou=users,dc=resdigita,dc=org
dn: cn=hvkhyn,ou=users,dc=resdigita,dc=org
dn: uid=hvkhyn,ou=invitations,dc=resdigita,dc=org
dn: ou=apps,ou=groups,dc=resdigita,dc=org
dn: cn=mail,ou=apps,ou=groups,dc=resdigita,dc=org
dn: cn=yellowmorgan1967,ou=users,dc=resdigita,dc=org
dn: uid=yellowmorgan1967,ou=invitations,dc=resdigita,dc=org
dn: cn=Maelanc,ou=users,dc=resdigita,dc=org
dn: uid=Maelanc,ou=invitations,dc=resdigita,dc=org
dn: cn=siZaVhvEFMqn,ou=users,dc=resdigita,dc=org
dn: uid=siZaVhvEFMqn,ou=invitations,dc=resdigita,dc=org
dn: cn=RajyUrKdEHJZogG,ou=users,dc=resdigita,dc=org
dn: cn=Hasaera,ou=users,dc=resdigita,dc=org
dn: uid=Hasaera,ou=invitations,dc=resdigita,dc=org
dn: cn=test,ou=users,dc=resdigita,dc=org
dn: uid=test,ou=invitations,dc=resdigita,dc=org
```
## Step 3 Copy mailboxes

```
[root@vpsfreecz001:~/nixops]# rsync -a /var/vmail/ gvois.in:/var/vmail
[root@hetzner005:~/nixops]#  ls -la /var/vmail/
total 92
drwx------ 23 virtualMail virtualMail 4096 23 juil. 22:47 .
drwxr-xr-x 13 root        root        4096 12 août  05:20 ..
drwxr-xr-x  3 virtualMail virtualMail 4096 18 juil. 23:07 actention.com
drwxr-xr-x  3 virtualMail virtualMail 4096 18 juil. 23:07 demarchic.com
drwxr-xr-x  3 virtualMail virtualMail 4096 18 juil. 23:07 grandvois.in
drwx------  4 virtualMail virtualMail 4096 31 juil. 17:54 gvoisin.com
drwxr-xr-x  9 virtualMail virtualMail 4096 18 juil. 23:07 gvois.org
drwxr-xr-x  3 virtualMail virtualMail 4096 18 juil. 23:07 howwownow.com
drwxr-xr-x  5 virtualMail virtualMail 4096 18 juil. 23:07 idgouv.com
drwxr-xr-x  3 virtualMail virtualMail 4096 18 juil. 23:07 igouv.com
drwxr-xr-x 21 virtualMail virtualMail 4096 16 août  15:52 lesgrandsvoisins.com
drwxr-xr-x 17 virtualMail virtualMail 4096 27 juil. 16:14 lesgv.com
drwxr-xr-x  6 virtualMail virtualMail 4096 18 juil. 23:07 lgv.coop
drwxr-xr-x  8 virtualMail virtualMail 4096 18 juil. 23:07 lgvmail.com
drwxr-xr-x  5 virtualMail virtualMail 4096 18 juil. 23:07 libregood.com
drwxr-xr-x  3 virtualMail virtualMail 4096 18 juil. 23:07 maelanc.com
drwxr-xr-x  3 virtualMail virtualMail 4096 18 juil. 23:07 managence.com
drwxrws---  3 virtualMail virtualMail 4096 22 juil. 10:22 mann.fr
drwxr-xr-x  3 virtualMail virtualMail 4096 18 juil. 23:07 orglibre.com
drwxrws---  3 virtualMail virtualMail 4096 18 juil. 17:16 resdigita.com
drwx------  5 virtualMail virtualMail 4096 17 juil. 10:54 resdigita.org
drwxr-xr-x  3 virtualMail virtualMail 4096 18 juil. 23:07 village.tel
drwxr-xr-x  6 virtualMail virtualMail 4096 18 juil. 23:07 villagevoisin.com
```

### Correct the cn problem

```
[root@hetzner005:~/nixops]# cat mod1.ldif
dn: cn=test,ou=users,dc=resdigita,dc=org
changetype: modrdn
newrdn: cn=test@lesgrandsvoisins.com
deleteoldrdn: 1
[root@hetzner005:~/nixops]# ldapmodify -H ldap:/// -D "cn=admin,dc=resdigita,dc=org" -y /root/nixops/hetzner/.secrets.bind  -f mod1.ldif
[root@hetzner005:~/nixops]# systemctl restart dovecot postfix sogo
```

Identification to imap doesn't work from SOGo


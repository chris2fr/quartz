# Installation et exploitation de Guichet

- Installation du serveur
- Mise en place sur serveur sur ma machine personnelle 

## Objectifs

> Définition de dossier d'exploitation
> 
> Document contenant les informations dont l'équipe d'exploitation a besoin pour pouvoir assurer une exploitation en règle du système et pouvoir réagir de manière appropriée lorsqu'un problème surgit.
>
> https://dico.developpez.com/html/1150-Gestion-de-projet-dossier-dexploitation.php



Run Book

https://fr.wikipedia.org/wiki/Runbook

- [ ] Faire une documentation Quartz

Comment connecter ldap depuis jxplorer

- ouvrir jxplorer
- machine debian pour recup l'ip devant inet  - "ip a"  
  172.29.49.189/20-
- BASE DN : dt=resdigita,dc=org 
- Utilisateur : cn=admin,dc=resdigita,dc=org

## Système d'exploitaition 

Windows 11 avec WSL2 

### Linux Debian dans WSL2

Debian 12 depuis WindoseStore

``` 
$ cat /etc/wsl.conf
[boot]
systemd=true
```

### LDAP Dans Linux

- ldapsearch
- installer slapd

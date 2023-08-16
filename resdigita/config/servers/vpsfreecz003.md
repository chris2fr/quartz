---
title: "Serveur de stage pour stagiaire"
date: 2023-08-14
---

Nous avons mis de côté un serveur de qualification pour le stage. En voici les spécifications. 

> [!note] Pour avoir accès
>
> Le ou la stagiaire pourra y accéder avec `ssh root@stage.resdigit.org` `ssh root@stage.lesgrandsvoisins.com` par exemple. **Attention !** Il s'agit d'un système Nixos qui est un peu particulier dans sa gestion. 
## Spécifications du serveur

| . | . |
| --- | --- |
|ID:|24309|
|Node:|[node1.stg](https://vpsadmin.vpsfree.cz/?page=node&id=400)|
|Storage pool:|[tank](https://vpsadmin.vpsfree.cz/?page=node&id=400)|
|Location:|Staging|
|Environment:|Staging|
|Owner:|[lesgrandsvoisins](https://vpsadmin.vpsfree.cz/?page=adminm&section=members&action=edit&id=5424)|
|Created at:|2023-08-14 13:08:20|
|State:|active|
|Expiration:|2023-09-13 13:08:20|
|Distribution:|NixOS 23.05|
|Status:|stopped ([start](https://vpsadmin.vpsfree.cz/?page=adminvps&action=info&run=start&veid=24309&t=da50cf75e9c662106484f7b36ca166949b44ce0a), [open remote console](https://vpsadmin.vpsfree.cz/?page=console&veid=24309&t=da50cf75e9c662106484f7b36ca166949b44ce0a))|
|Hostname:|stage|
|Uptime:|-|
|Load average:|-|
|Processes:|-|
|CPU:|-|
|RAM:|-|
|HDD:|0.00 GB|


## SSH connection

|The following credentials can be used on a newly created VPS with the default configuration.|   |
|User:|root|
|Password or SSH key:|Set root password or deploy public key in the forms below.|
|Address:|One of:  <br><br>- 37.205.14.40<br>- 2a03:3b40:fe:3a0::1<br>- 2a03:3b40:fe:3a2::1

> [Example]
> 
> ssh root@37.205.14.40


## Installation de containeur pour Ubuntu

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

## Installation d'un containeur Ubuntu 23.04

Voici les commandes utilisées: 
```
lxc image list images:
lxc profile device add default root disk path=/ pool=default
lxd init
lxc launch images:ubuntu/mantic vpsfreecz00301
lxc network create lxdbr0
lxc network attach lxdbr0 vpsfreecz00301

```


Here is the result of `lxd init`
```
config:
  core.https_address: 37.205.14.40:8443
networks: []
storage_pools:
- config: {}
  description: ""
  name: local
  driver: dir
profiles:
- config:
    security.privileged: "true"
  description: ""
  devices:
    root:
      path: /
      pool: local
      type: disk
  name: default
projects: []
cluster:
  server_name: vpsfreecz003
  enabled: true
  member_config: []
  cluster_address: ""
  cluster_certificate: ""
  server_address: ""
  cluster_password: ""
  cluster_certificate_path: ""
  cluster_token: ""

```

Voici le résultat de la configuration réseau

|      NAME      |  STATE  |         IPV4         |                     IPV6                      |   TYPE    | SNAPSHOTS |   LOCATION   |
| ----------------| ---------| ----------------------| -----------------------------------------------| -----------| -----------| --------------| 
| vpsfreecz00301 | RUNNING | 10.82.238.149 (eth0) | fd42:1ce2:442d:5351:216:3eff:fefe:8c82 (eth0) | CONTAINER | 0         | vpsfreecz003 |
## Pour accéder à vpsfreecz00301

Depuis vpsfreecz003,

`lxc exec vpsfreecz003 bash`

## Configuration DNS et Reverse Proxy à vpsfreecz00301

Des peudonymes DNS et des reverse proxy sont à configurer depuis vpsfreecz003.lesgrandsvoisins.com

```
lxc profile create routed
lxc profile edit routed
```
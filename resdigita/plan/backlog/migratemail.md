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



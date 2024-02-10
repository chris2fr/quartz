cd /mnt/d/work/quartz/
rm ./assets/indices/*.json
hugo-obsidian -input=resdigita -output=assets/indices -index -root=.
hugo --enableGitInfo --minify --baseURL=https://quartz.resdigita.com
cp -a ./assets/fonts/ ./public/fonts
rsync -a --delete public/ www.resdigita.org:/var/www/resdigitacom

cd /mnt/d/work/quartz/
rm ./assets/indices/*.json
hugo-obsidian -input=content -output=assets/indices -index -root=.
hugo --enableGitInfo --minify --baseURL=https://www.resdigita.com
cp -a ./assets/fonts/ ./public/fonts
rsync -a public/ www.resdigita.com:/var/www/resdigitacom

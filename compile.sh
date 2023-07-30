cd /mnt/d/work/quartz/
rm ./assets/indices/*.json
hugo-obsidian -input=content -output=assets/indices -index -root=.
hugo --enableGitInfo --minify --baseURL=http://172.19.168.52:8000 
cd public ; python3 -m http.server

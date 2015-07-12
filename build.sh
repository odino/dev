find . -mindepth 1 -maxdepth 1 -type d -not -path '*/\.*' |  \
xargs basename | \
awk {'print "docker build -t " $1 " " $1'} | \
bash
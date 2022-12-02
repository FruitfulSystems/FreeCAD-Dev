. ./.env

xhost si:localuser:root

export NO_AT_BRIDGE=1 #see here for why https://gist.github.com/jeffcogswell/62395900725acef1c0a5a608f7eb7a05

docker compose build
docker compose up
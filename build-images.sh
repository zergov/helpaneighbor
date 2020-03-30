CURRENT_COMMIT_HASH=$(git log -1 --format=%h)
RAILS_MASTER_KEY=$(cat config/master.key)

docker build --build-arg="RAILS_MASTER_KEY=$RAILS_MASTER_KEY" -t zergov/helpaneighbor:$CURRENT_COMMIT_HASH -f Dockerfile.production .
docker build --build-arg="RAILS_MASTER_KEY=$RAILS_MASTER_KEY" -t zergov/helpaneighbor:latest -f Dockerfile.production .

docker push zergov/helpaneighbor:$CURRENT_COMMIT_HASH
docker push zergov/helpaneighbor:latest

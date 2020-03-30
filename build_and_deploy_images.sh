CURRENT_COMMIT_HASH=$(git log -1 --format=%h)

docker build -t zergov/helpaneighbor:$CURRENT_COMMIT_HASH -f Dockerfile.production .
docker build -t zergov/helpaneighbor:latest -f Dockerfile.production .

docker push zergov/helpaneighbor:$CURRENT_COMMIT_HASH
docker push zergov/helpaneighbor:latest

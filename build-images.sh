current_commit_hash=$(git log -1 --format=%h)

docker build -t zergov/helpaneighbor:$current_commit_hash -f Dockerfile.production .
docker build -t zergov/helpaneighbor:latest -f Dockerfile.production .

docker push zergov/helpaneighbor:$current_commit_hash
docker push zergov/helpaneighbor:latest

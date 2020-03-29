set -e

bundle exec rails db:exists && bundle exec rails db:migrate || bundle exec rails db:setup

rm -f tmp/pids/server.pid
bundle exec rails s -b 0.0.0.0

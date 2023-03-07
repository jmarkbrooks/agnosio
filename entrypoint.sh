#! /bin/sh
set -e
bundle exec rails db:prepare
bundle exec rails assets:precompile
rm -f tmp/pids/server.pid
exec "$@" # Executes the image CMD

rbenv local 2.1.1
ruby -v
if !(command -v bundle > /dev/null 2>&1); then
echo "install bundle"
gem install bundle
fi
bundle install
rake db:migrate
COVERAGE=on rake ci:setup:rspec spec RAILS_ENV=test

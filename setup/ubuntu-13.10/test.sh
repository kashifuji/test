eval "$(rbenv init -)"
chmod -R 700 .rbenv
cp -r /var/volume/* ./
export PATH=$PATH:`pwd`/.rbenv/versions/2.1.1/bin/
rbenv local 2.1.1
ruby -v
if !(command -v bundle > /dev/null 2>&1); then
echo "install bundle"
gem install bundle
fi
bundle install
rake db:migrate
# unit test
COVERAGE=on rake ci:setup:rspec spec RAILS_ENV=test
# code check
bundle exec rails_best_practices .
# copy test result
cp -r spec/reports /var/volume/spec/
cp -r coverage /var/volume/

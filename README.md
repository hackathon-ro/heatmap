heatmap
=======

heatmaps



sinatra heatmap
===============

  # change to root

  apt-get install zlib1g-dev zlib1g
  apt-get install libssl-dev libreadline6-dev libxml2-dev libsqlite3-dev
  apt-get install libsqlite3-dev
  apt-get upgrade

  curl https://raw.github.com/wayneeseguin/rvm/master/binscripts/rvm-installer | bash -s stable
  source /etc/profile.d/rvm.sh
  rvm install 1.8.7
  rvm pkg install zlib
  rvm gem install activerecord
  rvm gem install sinatra
  rvm gem install json
  rvm gem install sqlite3


#!/bin/sh

# closeheat install script
#
# Thanks for having a look at the script!
# If you would like to install closeheat, just open up your terminal and type:
#
#    curl https://install.closeheat.com/<access_token> | sh
#

ACCESS_TOKEN='<access_token>'
# We want to run the script only when it is fully download.
# Wrapping it in function helps with that.
download_finished () {

# We will install a closheat npm package and set up your ~/.closeheat config
# file with your access token.

set -e
set -u

# Let's display everything on stderr.
exec 1>&2

echo '=> Installing closeheat toolkit.'
# Check if npm exists.
command -v npm >/dev/null && continue || {
  cat <<"EOF"

   Node Package Manager (npm) missing.

     The best way to install npm is to install node.js.
     npm is part of that package.

   Download node.js installer:

     http://nodejs.org

EOF
exit 1;
}

echo
echo '   Installing closeheat npm package...'
echo '     npm install -g closeheat'
# Try to install without sudo
# Will try with sudo if fails later
npm install -g closeheat
echo "   closeheat npm package installed."

if [ ! -d ~/.closeheat ];
then
  mkdir ~/.closeheat
fi


if [ ! -f ~/.closeheat/config.json ];
then
  touch ~/.closeheat/config.json
  echo "{\n  \"access_token\": \"$ACCESS_TOKEN\"\n}" > ~/.closeheat/config.json
fi

echo
echo "   closeheat configuration saved to $HOME/.closeheat/config.json"

echo
echo "Installation successful."
echo "------------------------"

cat <<"EOF"

Your list of apps deployed to closeheat:

  * getgymnast - last deployed 10 minutes ago.
    Develop quickly with:
    git clone git@github.com:ryzaskaciukas/getgymnast.git && cd getgymnast && closeheat

To create a new app:

  $ closeheat create ~/awesome_app
  $ cd ~/awesome_app
  $ closeheat

EOF

trap - EXIT
}

download_finished

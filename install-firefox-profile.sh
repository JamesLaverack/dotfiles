#!/usr/bin/env bash

echo "🦊 You need to have launched Firefox at least once for this to work"

firefox_profile="$(find ${HOME}/Library/Application\ Support/Firefox/Profiles -type d -name '*.default-release' | head -n1)"
echo "👤 Found firefox profile at ${firefox_profile}"

dotfiles_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cd ${dotfiles_dir}

user_js_file="${firefox_profile}/user.js"
if ! [ -L "${user_js_file}" ]
then
  rm -r "${user_js_file}" || true
  ln -s "${dotfiles_dir}/firefox-user.js" "${user_js_file}"
  echo "🦊 Linked Firefox user.js file"
else
  echo "🦊 Firefox user.js symlink exists"
fi

echo "🚀 Done"


#!/usr/bin/env bash

echo "🦊 You need to have launched Firefox at least once for this to work"

echo "🔪 Closing Firefox"
killall "firefox" &> /dev/null

firefox_profile="$(find ${HOME}/Library/Application\ Support/Firefox/Profiles -type d -name '*.default*' | head -n1)"
echo "👤 Found firefox profile at ${firefox_profile}"

arkenfox_overrides_file="${firefox_profile}/user-overrides.js"
if ! [ -L "${arkenfox_overrides_file}" ]
then
  rm -r "${arkenfox_overrides_file}" || true
  ln -s "${dotfiles_dir}/arkenfox-user-overrides.js" "${arkenfox_overrides_file}"
  echo "🎛️  Linked Arkenfox user overrides config"
else
  echo "🎛️  Arkenfox user overrides symlink exists"
fi

arkenfox_updater_script="${firefox_profile}/updater.sh"
if ! [ -f "${arkenfox_updater_script}" ]
then
  rm -r "${arkenfox_updater_script}" || true
  wget https://raw.githubusercontent.com/arkenfox/user.js/master/updater.sh -O "${arkenfox_updater_script}"
  echo "📜 Downloaded Arkenfox updater script"
else
  echo "📜 Arkenfox updater script exists"
fi

echo "🔄 Running Arkenfox updater script"
cd "${firefox_profile}"
bash updater.sh

arkenfox_cleaner_script="${firefox_profile}/prefsCleaner.sh"
if ! [ -f "${arkenfox_cleaner_script}" ]
then
  rm -r "${arkenfox_cleaner_script}" || true
  wget https://raw.githubusercontent.com/arkenfox/user.js/master/prefsCleaner.sh -O "${arkenfox_cleaner_script}"
  echo "📜 Downloaded Arkenfox cleaner script"
else
  echo "📜 Arkenfox cleaner script exists"
fi

echo "🧹 Running Arkenfox cleaner script"
cd "${firefox_profile}"
bash prefsCleaner.sh

echo "🚀 Done"


#!/bin/bash
sudo apt update

# we need curl for third party repos
sudo apt install -y curl

# Add third party repos
# Node.js
curl -fsSL https://deb.nodesource.com/setup_17.x | sudo -E bash -

# Brave Browser
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list

# VSCodium
wget -qO - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg \
    | gpg --dearmor \
    | sudo dd of=/usr/share/keyrings/vscodium-archive-keyring.gpg

echo 'deb [ signed-by=/usr/share/keyrings/vscodium-archive-keyring.gpg ] https://paulcarroty.gitlab.io/vscodium-deb-rpm-repo/debs vscodium main' \
    | sudo tee /etc/apt/sources.list.d/vscodium.list

# REST Insomnia
echo "deb [trusted=yes arch=amd64] https://download.konghq.com/insomnia-ubuntu/ default all" \
    | sudo tee -a /etc/apt/sources.list.d/insomnia.list

# Docker Engine
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Install packages
sudo apt update
sudo apt install -y vim htop neofetch git nodejs php8.0-cli codium rofi insomnia zsh ca-certificates curl gnupg lsb-release apt-transport-https curl brave-browser docker-ce docker-ce-cli containerd.io

# Docker Compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Create the directory where brave browser preferences will be after program first runs
mkdir ~/.config/BraveSoftware
mkdir ~/.config/BraveSoftware/Brave-Browser
mkdir ~/.config/BraveSoftware/Brave-Browser/Default

# Set brave bookmarks
cat <<MYBOOKMARKS > ~/.config/BraveSoftware/Brave-Browser/Default/Bookmarks
{
   "roots": {
      "bookmark_bar": {
         "children": [ {
            "date_added": "13284181923585695",
            "id": "2",
            "name": "🎹️",
            "type": "url",
            "url": "https://www.youtube.com/watch?v=bQx91RR3Y8o"
         }, {
            "children": [ {
               "date_added": "13284182363199408",
               "id": "4",
               "name": "Theme Developer Handbook | WordPress Developer Resources",
               "type": "url",
               "url": "https://developer.wordpress.org/themes/"
            }, {
               "date_added": "13284182370074732",
               "id": "5",
               "name": "REST API Handbook | WordPress Developer Resources",
               "type": "url",
               "url": "https://developer.wordpress.org/rest-api/"
            }, {
               "date_added": "13284182374774787",
               "id": "6",
               "name": "Block Editor Handbook | WordPress Developer Resources",
               "type": "url",
               "url": "https://developer.wordpress.org/block-editor/"
            }, {
               "date_added": "13284182400355416",
               "id": "7",
               "name": "Plugin Developer Handbook | WordPress Developer Resources",
               "type": "url",
               "url": "https://developer.wordpress.org/plugins/"
            }, {
               "date_added": "13284182280432780",
               "id": "8",
               "name": "PHP: Hypertext Preprocessor",
               "type": "url",
               "url": "https://www.php.net/"
            } ],
            "date_added": "13284181958258698",
            "date_modified": "13284182402529868",
            "id": "3",
            "name": "WordPress Dev",
            "type": "folder"
         }, {
            "date_added": "13284182522361644",
            "id": "9",
            "name": "Docker Hub",
            "type": "url",
            "url": "https://hub.docker.com/"
         }, {
            "date_added": "13284182459866456",
            "id": "10",
            "name": "npm",
            "type": "url",
            "url": "https://www.npmjs.com/"
         }, {
            "date_added": "13284182431241571",
            "id": "11",
            "name": "Stack Overflow",
            "type": "url",
            "url": "https://stackoverflow.com/"
         } ],
         "date_added": "13284181605256022",
         "date_modified": "13284182539585173",
         "id": "1",
         "name": "Bookmarks",
         "type": "folder"
      },
      "other": {
         "children": [  ],
         "date_added": "13284183442878059",
         "date_modified": "0",
         "id": "12",
         "name": "Other bookmarks",
         "type": "folder"
      },
      "synced": {
         "children": [  ],
         "date_added": "13284183442878061",
         "date_modified": "0",
         "id": "13",
         "name": "Mobile bookmarks",
         "type": "folder"
      }
   },
   "version": 1
}
MYBOOKMARKS

# Set brave browser settings to be minimalist
cat <<MINIMAL > ~/.config/BraveSoftware/Brave-Browser/Default/Preferences
{
    "account_id_migration_state": 2,
    "ntp": {
        "num_personal_suggestions": 4,
        "shortcust_visible": false
    },
    "bookmark_bar": {
      "show_on_all_tabs": true
    },
    "browser": {
      "has_seen_welcome_page": true
    },
    "autocomplete": {
      "retention_policy_last_version": 96
    },
    "default_search_provider_data": {
      "template_url_data": {
        "alternate_urls": [
          "{google:baseURL}#q={searchTerms}",
          "{google:baseURL}search#q={searchTerms}",
          "{google:baseURL}webhp#q={searchTerms}",
          "{google:baseURL}s#q={searchTerms}",
          "{google:baseURL}s?q={searchTerms}"
        ],
        "contextual_search_url": "{google:baseURL}_/contextualsearch?{google:contextualSearchVersion}{google:contextualSearchContextData}",
        "created_by_policy": false,
        "created_from_play_api": false,
        "date_created": "0",
        "doodle_url": "",
        "favicon_url": "https://www.google.com/favicon.ico",
        "id": "3",
        "image_url": "{google:baseSearchByImageURL}upload",
        "image_url_post_params": "encoded_image={google:imageThumbnail},image_url={google:imageURL},sbisrc={google:imageSearchSource},original_width={google:imageOriginalWidth},original_height={google:imageOriginalHeight}",
        "input_encodings": [
          "UTF-8"
        ],
        "is_active": 0,
        "keyword": ":g",
        "last_modified": "0",
        "last_visited": "13284193053095267",
        "logo_url": "",
        "new_tab_url": "",
        "originating_url": "",
        "preconnect_to_search_url": true,
        "prepopulate_id": 1,
        "safe_for_autoreplace": true,
        "search_url_post_params": "",
        "short_name": "Google",
        "suggestions_url": "{google:baseSuggestURL}search?{google:searchFieldtrialParameter}client={google:suggestClient}&gs_ri={google:suggestRid}&xssi=t&q={searchTerms}&{google:inputType}{google:omniboxFocusType}{google:cursorPosition}{google:currentPageUrl}{google:pageClassification}{google:searchVersion}{google:sessionToken}{google:prefetchQuery}sugkey={google:suggestAPIKeyParameter}",
        "suggestions_url_post_params": "",
        "synced_guid": "485bf7d3-0215-45af-87dc-538868000001",
        "url": "{google:baseURL}search?q={searchTerms}&{google:RLZ}{google:originalQueryForSuggestion}{google:assistedQueryStats}{google:searchFieldtrialParameter}{google:iOSSearchLanguage}{google:prefetchSource}{google:searchClient}{google:sourceId}{google:contextualSearchVersion}ie={inputEncoding}",
        "usage_count": 0
      }
    },
    "brave": {
        "default_browser": {
          "launching_count": 2
        },
        "hide_brave_rewards_button": true,
        "location_bar_is_wide": true,
        "new_tab_page": {
            "clock_format": "",
            "hide_all_widgets": true,
            "show_background_image": false,
            "show_binance": false,
            "show_branded_background_image": false,
            "show_brave_today": false,
            "show_clock": false,
            "show_gemini": false,
            "show_stats": false,
            "widget_visibility_migrated": true
        },
        "tabs_search_show": false,
        "wallet": {
            "show_wallet_icon_on_toolbar": false
        }
    }
}
MINIMAL

# Install VS Code / Codium extensions you want
codium --install-extension esbenp.prettier-vscode

# Overwrite your VS Code settings.json file with this instead...
cat <<MYSETTINGS > ~/.config/VSCodium/User/settings.json
{
  "breadcrumbs.enabled": false,
  "editor.minimap.enabled": false,
  "window.titleBarStyle": "custom",
  "workbench.editor.untitled.hint": "hidden",
  "terminal.integrated.defaultProfile.linux": "zsh",
  "workbench.startupEditor": "none",
  "debug.javascript.codelens.npmScripts": "never",
  "security.workspace.trust.enabled": false,
  "files.associations": {
    "*.js": "javascriptreact"
  },
  "editor.tabSize": 2,
  "editor.formatOnSave": true,
  "editor.formatOnPaste": true,
  "editor.defaultFormatter": "esbenp.prettier-vscode",
  "[javascript]": {
    "editor.defaultFormatter": "esbenp.prettier-vscode"
  },
  "prettier.semi": false,
  "prettier.arrowParens": "avoid",
  "prettier.printWidth": 9999,
  "prettier.trailingComma": "none",
  "prettier.quoteProps": "preserve"
}
MYSETTINGS

# Download and manually install Local WP, then delete deb file once complete
wget -P ~/Downloads/ "https://cdn.localwp.com/releases-stable/6.1.8+5621/local-6.1.8-linux.deb"
sudo apt install -y ~/Downloads/local-6.1.8-linux.deb
rm ~/Downloads/local-6.1.8-linux.deb

# Create projects folder in Documents if it does not already exist
if [ ! -d ~/Documents/projects ]; then
  mkdir -p ~/Documents/projects;
fi

# create my own np (new project) command, you give it one argument (the desired folder name)
# and it creates it in the ~/Documents/projects directory, opens it in Codium for you
# and automatically runs npm init -y for you.
echo 'mkdir ~/Documents/projects/$1 && codium ~/Documents/projects/$1 && cd ~/Documents/projects/$1 && npm init -y > /dev/null' > ~/Downloads/np
sudo mv ~/Downloads/np /usr/bin/np
sudo chmod +x /usr/bin/np

# create shell script file that will be our rofi keyboard shortcut command
echo 'codium ~/Documents/projects/$(ls ~/Documents/projects | rofi -dmenu -p "Open in Codium")' > ~/.rofi-codium-shortcut.sh

# Download wallpaper image
if [ ! -d ~/Pictures/Wallpapers ]; then
  mkdir -p ~/Pictures/Wallpapers;
fi
wget -O ~/Pictures/Wallpapers/brad2110wallpaper.jpg "https://github.com/LearnWebCode/21.10/blob/main/brad2110wallpaper.jpg?raw=true"

# Use dconf to...
# ... set clock to am / pm 12 hour instead of 24 hour
# ... set favorite apps / icons in dock
# ... set Gnome Terminal colors + transparency etc...
# ... set Rofi keyboard shortcut
# ... set desktop wallpaper image
cat <<MYGNOME > ~/Downloads/mygnome.dconf
[org/gnome/shell]
favorite-apps=['org.gnome.Nautilus.desktop', 'org.gnome.Terminal.desktop', 'brave-browser.desktop', 'codium.desktop', 'insomnia.desktop', 'local.desktop']
[org/gnome/terminal/legacy/profiles:/:b1dcc9dd-5262-4d8d-a863-c897e6d979b9]
background-color='rgb(13,11,20)'
background-transparency-percent=25
foreground-color='rgb(208,207,204)'
use-theme-colors=false
use-theme-transparency=false
use-transparent-background=true
[org/gnome/shell/extensions/ding]
show-home=false
[org/gnome/desktop/input-sources]
per-window=false
[org/gnome/desktop/wm/keybindings]
activate-window-menu=@as []
[org/gnome/settings-daemon/plugins/media-keys]
custom-keybindings=['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/']
[org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0]
binding='<Alt>space'
command='sh -c "/bin/bash ~/.rofi-codium-shortcut.sh"'
name='Rofi'
[org/gnome/desktop/interface]
clock-format='12h'
[org/gtk/settings/file-chooser]
clock-format='12h'
[org/gnome/desktop/background]
color-shading-type='solid'
picture-options='zoom'
picture-uri='file:///home/$(whoami)/Pictures/Wallpapers/brad2110wallpaper.jpg'
primary-color='#000000'
secondary-color='#000000'
MYGNOME
dconf load / < ~/Downloads/mygnome.dconf
rm ~/Downloads/mygnome.dconf
killall gnome-shell

# allow docker commands without needing sudo
# Temporarily, you'll need to use sudo with docker and docker-compose commands, however
# as soon as you restart your computer group memberships will be fully refreshed
# and you'll be able to use docker and docker-compose without sudo.
# sudo groupadd docker
sudo usermod -aG docker $USER

# Oh My ZSH
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended



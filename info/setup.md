# Software

- Chrome
- Brew
- Dropbox
- Skype
- Slack
- [Spectacle](https://www.spectacleapp.com)
  - CMD+CTRL+HJKLYUNMIOF;'
- [Alfred](https://www.alfredapp.com)
  - MDN (js), Leo (t)
  - Ctrl+Return (Search with default web search)
- Postman
- Docker
- AutoMute
- [AppCleaner](https://freemacsoft.net/appcleaner/)
- [SDKMAN](http://sdkman.io/install.html)
  - sdk install java
  - sdk install scala
  - sdk install groovy
  - sdk install gradle
- IntelliJ IDEA
  - Plugins
    - IdeaVim
    - Ace Jump (/, <Space>w,e,b,j,k)
  - import settings: intellij-settings.jar

# Brew

- tree
- bash-completion
- the_silver_searcher
- git (if not linked: brew link git)
- vim (brew install vim --override-system-vim)
- tmux
- reattach-to-user-namespace
- node
  - upgrade
    - sudo npm cache clean -f
    - sudo npm install -g n
    - sudo n stable
- awscli
- fzf (run this after: /usr/local/opt/fzf/install)

# Config

- [Keyboard Setting: Caps Lock -> Strg & Esc](https://github.com/tekezo/Karabiner-Elements)
  - copy karabiner.json to ~/.config/karabiner/karabiner.json
- clone & install dotfiles
- Solarized Terminal (myprofile.dark.terminal)
- Vundle Plugin Manager
  - Install Vundle Plugins (:PluginInstall)
  - Install YCM (cd ~/.vim/bundle/YouCompleteMe ./install.py --tern-completer)
- Tmux Plugin Manager
  - Install Tmux Plugins (prefix + I)
- Docker CLI Autocomplete
  - cd /usr/local/etc/bash_completion.d
  - ln -s /Applications/Docker.app/Contents/Resources/etc/docker.bash-completion
  - ln -s /Applications/Docker.app/Contents/Resources/etc/docker-machine.bash-completion
  - ln -s /Applications/Docker.app/Contents/Resources/etc/docker-compose.bash-completion
- Chrome Plugins
  - Adblock Plus
  - JSON Formatter
  - LastPass
  - Markdown Preview
  - Pocket
  - Postman Interceptor
  - uBlock Origin
  - Vimium
    - use vimium.txt for config

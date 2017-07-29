# Software

- Chrome
- Brew
- Dropbox
- Skype
- Slack
- [Spectacle](https://www.spectacleapp.com)
  - CMD+CTRL+HJKLYUNMIOF;'
- [Alfred](https://www.alfredapp.com)
  - MDN (js), Leo (t), Google (g), Maps (m), Gmail (gm)
  - Ctrl+Return (Search with default web search)
- Postman
- Docker
- [AppCleaner](https://freemacsoft.net/appcleaner/)
- [SDKMAN](http://sdkman.io/install.html)
  - sdk install java
  - sdk install scala
  - sdk install gradle
- IntelliJ IDEA
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

- [Keyboard Setting: Caps Lock -> Strg & Esc](https://github.com/wwwjfy/Karabiner-Elements/releases)
  - copy karabiner.json to ~/.config/karabiner/karabiner.json
- clone & install dotfiles
- Solarized Terminal (myprofile.dark.terminal)
- Vundle Plugin Manager
  - Install Vundle Plugins (:PluginInstall)
  - Install YCM (cd ~/.vim/bundle/YouCompleteMe ./install.py --tern-completer)
- Tmux Plugin Manager
  - Install Tmux Plugins (prefix + I)
- Docker CLI Autocomplete
  - curl -XGET https://raw.githubusercontent.com/docker/docker/master/contrib/completion/bash/docker > `brew --prefix`/etc/bash_completion.d/docker
  - curl -L https://raw.githubusercontent.com/docker/compose/$(docker-compose version --short)/contrib/completion/bash/docker-compose -o usr/local/etc/bash_completion.d/docker-compose
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

# Vim from source

https://github.com/Valloric/YouCompleteMe/wiki/Building-Vim-from-source

```
./configure --with-features=huge \
            --enable-multibyte \
            --enable-rubyinterp \
            --enable-pythoninterp \
            --with-python-config-dir=/usr/lib/python2.7/config-x86_64-linux-gnu \
            --enable-perlinterp \
            --enable-luainterp \
            --enable-cscope --prefix=/usr --enable-gui=gtk2 --with-x
```

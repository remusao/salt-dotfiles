
vim-plug-installed?:
  file.exists:
    - name: {{ grains.homedir }}/.local/share/nvim/site/autoload/plug.vim

vim-plugged:
  file.managed:
    - name: {{ grains.homedir }}/.local/share/nvim/site/autoload/plug.vim
    - source: https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    - makedirs: True
    - user: {{ grains.user }}
    - onfail:
      - file: vim-plug-installed?

vim-configuration:
  file.managed:
    - name: {{ grains.homedir }}/.config/nvim/init.vim
    - source: salt://vim/init.vim
    - template: jinja
    - makedirs: True
    - user: {{ grains.user }}

vim-includes:
  file.recurse:
    - name: {{ grains.homedir }}/.vim/
    - makedirs: True
    - source: salt://neovim/config/
    - clean: True
    - user: {{ grains.user }}

# TODO - deps for YouCompleteMe and cpsm
# TODO - virtualenvs
# TODO - run :PlugInstall/:PlugUpdate

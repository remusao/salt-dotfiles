
brew:
  cmd.run:
    - name: /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    - unless: command -v brew > /dev/null 2>&1
    - require_in:
      - file: brew-brewfile

brew-brewfile:
  file.managed:
    - name: {{ grains['homedir'] }}/.config/brew/Brewfile
    - source: salt://packages/Brewfile
    - user: {{ grains['user'] }}
    - makedirs: True
    - require_in:
      - cmd: brew-bundle

brew-bundle:
  cmd.run:
    - name: brew bundle install --file={{ grains['homedir'] }}/.config/brew/Brewfile
    - runas: {{ grains.user }}

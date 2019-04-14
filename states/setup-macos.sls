brew-brewfile:
  file.managed:
    - name: {{ grains['homedir'] }}/.config/brew/Brewfile
    - source: salt://macOS/Brewfile
    - user: {{ grains['user'] }}
    - makedirs: True

macOS-brew:
  cmd.run:
    - name: brew bundle install --file={{ grains['homedir'] }}/.config/brew/Brewfile
    - runas: {{ grains.user }}

git-config:
  file.managed:
    - name: {{ grains.homedir }}/.config/git/config
    - makedirs: True
    - source: salt:///git/config
    - user: {{ grains.user }}
    - force: True

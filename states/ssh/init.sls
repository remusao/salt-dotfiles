ssh-configuration:
  file.managed:
    - name: {{ grains.homedir }}/.ssh/config
    - source: salt://ssh/config
    - user: {{ grains.user }}
    - makedirs: True

i3-configuration:
  file.managed:
    - name: {{ grains.homedir }}/.config/i3/config
    - source: salt://i3/config
    - makedirs: True

i3-status-configuration:
  file.managed:
    - name: {{ grains.homedir }}/.config/i3status/config
    - source: salt://i3/i3status.conf
    - makedirs: True

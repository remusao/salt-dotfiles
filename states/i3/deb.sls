# i3-keyring:
#   pkg.installed:
#     - sources:
#       - i3-keyring: salt://i3/sur5r-keyring_2019.02.01_all.deb
#     - require_in:
#       - pkg: i3wm

i3wm:
  pkg.latest:
    - pkgs:
      - i3
      - i3status
      - i3lock
    - refresh: True

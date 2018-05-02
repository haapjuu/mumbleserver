mumble-server:
  pkg.installed

mumble:
  pkg.installed

/etc/mumble-server.ini:
  file.managed:
    - source: salt://mumble/mumble-server.ini

ufw-enable-mumble-port:
  cmd.run:
    - name: 'sudo ufw allow 64738/tcp'

ufw-enable:
  cmd.run:
    - name: 'sudo ufw enable'

restart-ufw:
  cmd.run:
    - name: 'sudo systemctl restart ufw.service'

restart-mumble-server:
  cmd.run:
    - name: 'sudo systemctl restart mumble-server.service'

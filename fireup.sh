#!/bin/bash
# fireup africas talking mock api
cd ~/VMs/smsl/api
twistd -y site.py

# fireup txsmsl
cd ~/VMs/smsl/txsmsl
twistd -y tx-site.py

# tail follow api logs
cd ~/VMs/smsl/api/logs
gnome-terminal --tab -e "/bin/bash -c 'tailf sim.log; exec /bin/bash -i'"

# start ngrok and listen to port 8000
cd ~/Software/ngrok
Mod4 + v
gnome-terminal --tab -e "/bin/bash -c './ngrok http 127.0.0.1:8000; exec /bin/bash -i'"

# start django local server
# later to do ssh login ;)
cd ~/VMs/smsl
gnome-terminal --tab -e "/bin/bash -c 'source .venv/bin/activate && cd smsleopard && ./manage.py runserver; exec /bin/bash -i'"

# tail django logs
cd /var/log/smsleopard/app
gnome-terminal --tab -e "/bin/bash -c 'tailf smsleopard.log; exec /bin/bash -i'"


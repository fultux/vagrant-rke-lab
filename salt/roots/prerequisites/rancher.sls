rancher:
  user.present:
    - fullname: rancher
    - shell: /bin/bash
    - home: /home/rancher
    - groups:
      - docker
      - users
      
rancher_pubkey:
  ssh_auth.present:
    - user: rancher
    - names:
      - ssh-rsa {{ pillar['ssh_key']['my_key'] }}
    - require: 
      - user: rancher
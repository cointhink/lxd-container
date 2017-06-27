config: {}
description: Cointhink Scripting Environment
devices:
  eth0:
    nictype: bridged
    parent: lxdbr0
    type: nic
    security.mac_filtering: true
  root:
    path: /
    pool: default
    type: disk
name: cointhink

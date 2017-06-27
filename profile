config: {}
description: Default LXD profile
devices:
  eth0:
    nictype: bridged
    parent: lxdbr0
    type: nic
  root:
    path: /
    pool: default
    type: disk
name: default
used_by:
- /1.0/containers/algoruns-b3cb-b36ceb0f2de0
- /1.0/containers/charming-marlin
- /1.0/containers/charming-marlin/cointhink-0.0.1

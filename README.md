# Lima Ansible

Run Ansible playbooks against qemu VMs on Macs via [lima](https://github.com/lima-vm/lima)

This setup is great for being able to test Ansible playbooks locally, not real servers required

## Deployment

gnu make is used for all tasks, which is typically installed on Macs by default

### Dependencies

`make depends` performs a `brew install ansible lima` to install the dependencies to be able to run this. This presumes that you already have homebrew installed.

### VMs

`make vms` starts two VMs, a web server and a db server. The choice is arbitrary, but we can currently only support a single instance of each type due to the way the SSH configuration is managed

### Ansible ping

`make ansible-ping` pings the two VMs to ensure they're up and healthy

### Ansible

`make ansible` runs the playbook.yml playbook against the two servers. This currently has a single common role that gets deployed to both hosts which installs the `sl` yum package

### Clean

`make clean` destroys the VMs

## Shell

You can get a shell on either VM by running `limactl shell myweb` or `limactl shell mydb`

You can run the `sl` command that the playbook installed directly on the VMs by running `LIMA_INSTANCE=myweb lima sl` or `LIMA_INSTANCE=mydb lima sl`

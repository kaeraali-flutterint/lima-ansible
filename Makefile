.PHONY: vms
vms:
	limactl start --name myweb --tty=false template://fedora
	limactl start --name mydb --tty=false template://fedora

.PHONY: ansible-ping
ansible-ping:
	ansible -m ping -i hosts web
	ansible -m ping -i hosts db

.PHONY: ansible
ansible:
	ansible-playbook -i hosts playbook.yml

.PHONY: clean
clean:
	limactl delete myweb --force
	limactl delete mydb --force

.PHONY: depends
depends:
	brew install ansible lima

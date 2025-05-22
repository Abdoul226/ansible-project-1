
.PHONY: web db all

INVENTORY=inventory/hosts.ini

web:
	ansible-playbook -i $(INVENTORY) playbooks/web-setup.yml

db:
	ansible-playbook -i $(INVENTORY) playbooks/db-setup.yml

all: web db

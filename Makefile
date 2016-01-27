
.PHONY: tests
tests:
	bash tests/tests.sh

.PHONY: install
intall:
	ansible-playbook -i vagrant.ini site.yml

.PHONY: bootstrap_ssh_key
bootstrap_ssh_key:
	cat ~/.ssh/id_rsa.pub > scripts/id_rsa.pub

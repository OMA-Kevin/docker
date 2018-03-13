export ANSIBLE_HOST_KEY_CHECKING=False
ansible-playbook install-docker.yml -i ./hosts $1

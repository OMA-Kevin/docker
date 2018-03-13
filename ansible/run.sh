
docker run \
         -it \
         -v /home/svc_unix/.ssh:/home/svc_unix/.ssh:ro \
         -v $(pwd)/ansible/:/etc/ansible/ \
         -v $(pwd):/ansible/playbooks \
         -w /ansible/playbooks \
         --rm=true \
         ansible \
         ansible-playbook test.yml


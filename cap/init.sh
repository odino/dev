cp -r /ssh/* /root/.ssh/
chmod 600 /root/.ssh/id_rsa
echo "sshsetup && cap deploy -S branch=... -S user=anadalin" >> ~/.bash_history

```bash
# Login with root use and create ansible user and provide sudo acess in all servers.
# Creating a user called as ansible on all the hosts
useradd ansible
passwd ansible

# make the necessary entrys so that ansible user can go with sudo and password less access
visudo
  ansible ALL=(ALL)       NOPASSWD: ALL

# Enable password based authentication
vi /etc/ssh/sshd_config

# Restart the sshd service
service sshd restart


# Install ansible only on the controller 
sudo yum install ansible -y

###### Configuring Ansible #####

# Switch to ansivle user from controller
su - ansible

# Add private ips of your hosts under 
/etc/ansible/hosts

# In ansible controller , create a key pair
ssh-keygen

# Copy the keys into the hosts as ansible user
ssh-copy-id ansible@<PRIVAT_IP_ADDRESS_OF_HOST>

# Try to connect to hosts, without password
ssh ansible@<PRIVAT_IP_ADDRESS_OF_HOST> # No password should be asked. 

```

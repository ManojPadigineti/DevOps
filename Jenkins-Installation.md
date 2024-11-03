```bash
sudo dnf update -y
sudo dnf install wget -y

# Create a directory for Java installation
sudo mkdir -p /opt/java

# Download OpenJDK 11 (or any desired version)
wget https://download.java.net/java/GA/jdk11/openjdk-11_linux-x64_bin.rpm -P /tmp

# Install the downloaded RPM package
sudo rpm -ivh /tmp/openjdk-11_linux-x64_bin.rpm --install --prefix=/opt/java

# Add JAVA_HOME to the profile
echo "export JAVA_HOME=/opt/java" | sudo tee -a /etc/profile.d/java.sh
echo "export PATH=\$PATH:\$JAVA_HOME/bin" | sudo tee -a /etc/profile.d/java.sh

# Load the new environment variables
source /etc/profile.d/java.sh

# Create a Jenkins repo file
sudo tee /etc/yum.repos.d/jenkins.repo <<EOF
[jenkins]
name=Jenkins-stable
baseurl=https://pkg.jenkins.io/redhat-stable/jenkins.repo
gpgcheck=1
gpgkey=https://pkg.jenkins.io/redhat-stable/jenkins.io.key
EOF

# Import the GPG key for Jenkins repository
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key

sudo dnf install jenkins -y
sudo vi /etc/sysconfig/jenkins
JENKINS_JAVA_CMD="/opt/java/bin/java"

sudo systemctl start jenkins
sudo systemctl enable jenkins
```

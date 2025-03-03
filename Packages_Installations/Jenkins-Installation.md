```bash
sudo wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
sudo yum upgrade
###Add required dependencies for the jenkins package
sudo yum install fontconfig java-17-openjdk
sudo yum install jenkins
sudo systemctl daemon-reload
```
```bash
##Jenkins service file
[Unit]
Description=Jenkins Continuous Integration Server
Requires=network.target
After=network.target

[Service]
Type=simple  # Use 'simple' if you're directly executing a command.
User=jenkins
Group=jenkins

Environment="JAVA_HOME=/opt/java/jdk-17"
Environment="JENKINS_HOME=/var/lib/jenkins"
ExecStart=/opt/java/java-17/bin/java  -jar /usr/share/java/jenkins.war  #Change Executable

Restart=on-failure

[Install]
WantedBy=multi-user.target
```

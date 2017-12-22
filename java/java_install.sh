sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install oracle-java8-installer

echo 'JAVA_HOME="/usr/lib/jvm/java-8-oracle"' >> ~/.bashrc
JAVA_HOME="/usr/lib/jvm/java-8-oracle"

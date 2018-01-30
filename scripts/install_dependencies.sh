# Java and Tomcat installation


# Install prepare infrastructure
yum -y update 
yum -y install wget 
yum -y install tar

# Prepare environment 
mkdir /opt/java
mkdir /opt/tomcat
JAVA_HOME=/opt/java
Tomcat_HOME=/opt/tomcat 
PATH=$PATH:$JAVA_HOME/bin:$Tomcat_HOME/bin:$Tomcat_HOME/scripts

# Install Oracle Java8
JAVA_VERSION=8u144
wget https://s3-eu-west-1.amazonaws.com/sgnraghavbucket/jdk-${JAVA_VERSION}-linux-x64.tar.gz
tar -xvf jdk-${JAVA_VERSION}-linux-x64.tar.gz
rm -rf jdk*.tar.gz
mv jdk*/* ${JAVA_HOME}
#setting java home
echo "export JAVA_HOME=${JAVA_HOME}" >>~/.bashrc
echo "export PATH=$JAVA_HOME/bin:$PATH" >>~/.bashrc


# Install Tomcat
TOMCAT_VERSION=8.5.20
wget https://s3-eu-west-1.amazonaws.com/sgnraghavbucket/apache-tomcat-${TOMCAT_VERSION}.tar.gz
tar -xvf apache-tomcat-${TOMCAT_VERSION}.tar.gz
rm -rf apache-tomcat*.tar.gz
mv apache-tomcat*/* ${Tomcat_HOME}
#creating sample app
#mkdir ${Tomcat_HOME}/webapps/testapp
#echo "Hi Every one, test app is running. - Raghav" >> ${Tomcat_HOME}/webapps/testapp/index.html

chmod -R 755 ${Tomcat_HOME}/bin/
/opt/tomcat/bin/startup.sh
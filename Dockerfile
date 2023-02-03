FROM harness/delegate:23.01.78102.minimal
USER root
RUN microdnf update
RUN microdnf install yum

# Terraform Install
RUN yum install -y yum-utils
RUN yum update
RUN yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
RUN yum -y install terraform

# Kubectl Install
RUN mkdir /opt/harness-delegate/tools && cd /opt/harness-delegate/tools
RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && chmod +x kubectl 

#Env Path
ENV PATH=/opt/harness-delegate/tools/:$PATH


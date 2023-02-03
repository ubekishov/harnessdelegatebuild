FROM harness/delegate:23.01.78102.minimal
USER root

# Package Manager Install
RUN microdnf update
RUN microdnf install --nodocs unzip yum-utils

# Terraform Install
RUN yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
RUN microdnf install -y terraform
RUN mkdir /opt/harness-delegate/tools && cd /opt/harness-delegate/tools

# Kubectl Install
RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && chmod +x kubectl 

#Env Path
ENV PATH=/opt/harness-delegate/tools/:$PATH


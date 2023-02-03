FROM harness/delegate:23.01.78102.minimal
USER root
RUN microdnf update
RUN microdnf install --nodocs unzip yum-utils
RUN mkdir /opt/harness-delegate/tools && cd /opt/harness-delegate/tools


# Terraform
RUN yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
RUN microdnf install -y terraform

## Kubectl
RUN curl -LO https://dl.k8s.io/release/v1.24.3/bin/linux/amd64/kubectl -o kubectl
RUN chmod +x ./kubectl
RUN mv kubectl /opt/harness-delegate/custom-client-tools/kubectl

# ENV PATH=/opt/harness-delegate/tools/:$PATH
ENV PATH=/opt/harness-delegate/tools/:$PATH

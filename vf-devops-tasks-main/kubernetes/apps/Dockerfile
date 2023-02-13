FROM debian:bullseye-slim

LABEL AUTHOR DevOps Team @ Vodafone

RUN apt update
RUN apt install -y \
  curl \
  apt-transport-https \
  ca-certificates \
  gnupg \
  lsb-release \ 
  vim

ADD https://storage.googleapis.com/kubernetes-release/release/v1.24.2/bin/linux/amd64/kubectl /usr/local/bin
RUN chmod +x /usr/local/bin/kubectl && \
  echo 'alias k="kubectl"' >> ~/.bashrc

RUN curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 && \
  chmod 700 get_helm.sh && ./get_helm.sh && \
  echo 'alias h="helm"' >> ~/.bashrc

RUN mkdir /.kube
COPY kubeconfig /.kube/kubeconfig

ENV KUBECONFIG /.kube/kubeconfig

WORKDIR /app

COPY . .
RUN chmod +x install.sh

# ENTRYPOINT [ "./install.sh" ]

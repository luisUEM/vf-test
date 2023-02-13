FROM debian:bullseye-slim

LABEL AUTHOR DevOps Team @ Vodafone

RUN apt update
RUN apt install -y \
  curl \
  apt-transport-https \
  ca-certificates \
  gnupg \
  lsb-release

RUN mkdir -p /etc/apt/keyrings && \
  curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg && \
  echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
    $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null

RUN apt update && \
  apt install -y docker-ce docker-ce-cli containerd.io

RUN curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.14.0/kind-linux-amd64 && \
 chmod +x ./kind && mv ./kind /usr/local/bin

WORKDIR /app

ADD . .
RUN chmod +x ./start.sh

ENTRYPOINT ["./start.sh"]

FROM hashicorp/terraform:1.2.3

LABEL AUTHOR DevOps Team @ Vodafone

WORKDIR /app

COPY *.tf .
COPY modules/ modules/

ENTRYPOINT [ "/bin/sh", "-c", "terraform" ]
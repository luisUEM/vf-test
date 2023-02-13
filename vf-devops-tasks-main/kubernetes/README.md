# Kubernetes

## Description
We want to migrate an on-prem project to Kubernetes.

This project contains several small applications and a monitoring platform.
It's our first time deploying to Kubernetes and we are not able to figure out why some applications are not working. Due to our lack of knowledge we are probably missing some best practices.

Can you help us troubleshoot the apps, making them reliable, and answering some questions that we have?

```
To speed things up, we provide a fully working Kubernetes cluster using KinD with a partially working solution.
```

&nbsp;
## How to Start
---
- Check and run [deploy-cluster.sh](./deploy-cluster.sh)
- Check and run [deploy-apps.sh](./deploy-apps.sh)


&nbsp;
## Your task
---
> Troubleshooting
- The `web` and `runner` applications are not deploying. Identify the reason(s) why

> Once the issue is identified, rectify it then deploy the `web` and `runner` apps:
- Identify and fix the runner pod that is crashing
- Identify and fix the application [http://web.vf](http://web.vf)
    * If this URL is not reachable, check [deploy-cluster.sh](./deploy-cluster.sh) line 49;
    * You should see a `web page`

> Monitoring \
> _You can access prometheus at [http://prometheus.vf](http://prometheus.vf)_
- Make the `web` application discoverable by Prometheus under the `Targets` tab

> High-availability
- Make the `web` application highly-available as much as possible

> Basic Maintenance \
> _Provide the commands that answer these questions_
- Which is/are the hostname(s) in your cluster?
- How do you safely remove all pods from a node?
- How do you restart a deployment without downtime?
- How do you check the logs from a specific namespace?

&nbsp;
## Notes
---
- Remember `IaC`! \
we need to be able to reproduce your steps
- Double check the notes in [README.md](../README.md) in the root folder if something is not clear

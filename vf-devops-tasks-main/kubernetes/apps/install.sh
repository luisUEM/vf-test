## Deploy custom Runner application
helm install runner ./charts/runner --namespace runner --create-namespace

## Deploy Custom Web application
helm install web ./charts/web --namespace web --create-namespace

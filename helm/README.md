## Helm chart for the Indy-Monitoring-Stack

_**Work in progress, for development use only.**_

### Pre-requisites

*   K8s or minikube cluster
*   Helm v3+ binaries
*   Network\_monitor seed.s for chosen Indy network.s

### Quickstart

#### values.yaml

1.  Edit the **inputs** to list the networks you want to monitor. These networks must be defined in the [**conf/indy\_node\_monitor/networks.json**](./conf/indy_node_monitor/networks.json) file.
2.  (optional) If you want to expose services, set the **ingress** information.

#### secrets

Copy the 2 templates in the **secrets/** directory as **credentials.yaml** and **seeds.yaml** respectively.

```plaintext
cp credentials.template credentials.yaml
cp seeds.template seeds.yaml
```

Fill in the seeds which match the chosen networks in the inputs section of the **values.yaml** file. Choose a password for the Grafana admin account (GF_SECURITY_ADMIN_PASSWORD). You may leave the rest blank.

#### deploy

Once you are happy with the configuration, create the namespace and deploy the stack.

```plaintext
helm upgrade indy-monitoring-stack . \
    --namespace indy-monitoring-stack \
    --create-namespace --install
```

### Advanced configuration

#### service configuration

All service configurations are located in the **conf/** folder under their respective application directory. These configurations are loaded as configmaps during deployment and injected into the pods. 

You can apply a new configuration in 3 steps:

1.  Delete the previous corresponding configmap resource from the namespace.
2.  Run the helm upgrade command to generate the new configmap.
3.  Restart the pod corresponding to that service.

#### dashboard development

You can export a dashboard from grafana after you customize it and add the **\*.json** file generated under **conf/grafana/dashboards/**

Edit the **values.yaml** **dashboard** section to include your new dashboard (name **must** match the \*.json filename)

Follow the steps from the service configuration section to apply a new dashboard.

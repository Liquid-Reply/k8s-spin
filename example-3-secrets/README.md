# Spin using Secrets in Kubernetes

## Scenario

This scenario will demonstrate how to inject a Kubernetes secret into a Spin Application.

## Usage

Create a secret

```
$ kubectl create secret generic spin-password --from-literal="password=super-secret"
```

Deploy the Spin application:

```
$ kubectl apply -f deploy_spin-secret.yaml
```

Access the Spin application:

```
$ kubectl port-forward deployment/spin-secret 8000:80
```

And access `localhost:8000` in your browser.

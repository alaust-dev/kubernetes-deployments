# External Secret Operator
My secrets are manage by the [HashiCorp Vault](https://developer.hashicorp.com/vault) in combination with
the [External Secrets Operator](https://external-secrets.io/v0.8.1/).

## Deploy External Secret Operator
```sh
helm repo add external-secrets https://charts.external-secrets.io

helm install external-secrets \
   external-secrets/external-secrets \
    -n external-secrets \
    --create-namespace \
```

## Deploy a ClusterSecretStore
```sh
kubectl apply -f ClusterSecretStore.yaml
```

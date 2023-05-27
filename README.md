# kubernetes-deployments
This repository contains all my Kubernetes deployments.
I'm running my cluster on a single node using [Cilium](https://cilium.io/) as network plugin.

My secrets are manage by the [HashiCorp Vault](https://developer.hashicorp.com/vault) in combination with the [External Secrets Operator](https://external-secrets.io/v0.8.1/).
For every new Namespace you want to use secret from the Vault you have to set up a Secret Store.
Every Secret Store needs to authenticate itself to the Vault using a token defined as Secret in the Namespace.

You can set this token as follows:
````shell
kubectl create secret generic --namespace <NAMESPACE> vault-token --from-literal=token=<VAULT_TOKEN>
````

## Allowed unsafe sysctl option
The Wireguard deployment uses two sysctl option wich are disable as default in Kubernets.
To enable those you have to append following to your ```/var/lib/kubelet/config.yaml```:
````yml
...
allowedUnsafeSysctls:
  - "net.ipv4.ip_forward"
  - "net.ipv4.conf.all.src_valid_mark"
````
After that just restart the kubelet service with:
````shell
sudo systemctl restart kubelet.service
````

## Service Cluster IP ranges per Namespace

| Namespace   |       Cluster IP's        |
|-------------|:-------------------------:|
| mailserver  |  10.43.1.0 - 10.43.1.255  |
| uptime-kuma |  10.43.2.0 - 10.43.2.255  |
| jenkins     |  10.43.3.0 - 10.43.3.255  |
| stage       |  10.43.4.0 - 10.43.4.255  |
| production  |  10.43.5.0 - 10.43.6.255  |
| vault       |  10.43.7.0 - 10.43.7.255  |
| bitwarden   |  10.43.8.0 - 10.43.8.255  |
| wireguard   |  10.43.9.0 - 10.43.9.255  |
| opensearch  | 10.43.10.0 - 10.43.10.255 |

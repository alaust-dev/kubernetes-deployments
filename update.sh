#!/bin/bash

NAMESPACES=(
        'mailserver'
        'production'
        'bitwarden'
        'wireguard'
        'opensearch'
        'kube-system')


shopt -s globstar
for namespace in ${NAMESPACES[@]}; do
        kubectl delete secret --namespace $namespace vault-token
        kubectl create secret generic --namespace $namespace vault-token --from-literal=token=$1

        for path in ./$namespace/**/secret-store.yml; do
          kubectl delete -f $path
          kubectl apply -f $path
        done

        for path in ./$namespace/**/secret.yml; do
          kubectl delete -f $path
          kubectl apply -f $path
        done
done
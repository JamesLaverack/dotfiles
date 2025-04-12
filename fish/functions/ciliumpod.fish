#!/usr/bin/env fish

function ciliumpod
  kubectl get \
    pod \
    --namespace=kube-system \
    --selector='k8s-app=cilium' \
    --output=jsonpath='{.items..metadata.name}' \
    | \
    string split ' ' \
    | \
    fzf \
    -1 \
    --prompt='cilium pod> ' \
    --preview='kubectl \
      get po \
      --namespace=kube-system \
      {} \
      --output yaml \
      | \
      yq \
      --colors \
      "{\
        \"name\": .metadata.name, \
        \"namespace\": .metadata.namespace, \
        \"node\": .spec.nodeName, \
        \"phase\": .status.phase, \
        \"image\": .spec.containers[] | select(.name == \"cilium-agent\") | .image, \
        \"hostIPs\": .status.podIPs \
      }"'
end


function ciliumexec
  kubectl --namespace=kube-system exec -it (ciliumpod) --container=cilium-agent -- $argv
end


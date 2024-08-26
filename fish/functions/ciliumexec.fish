function ciliumexec
  kubectl exec --namespace kube-system --stdin --tty $(kubectl get pod --namespace kube-system --selector 'k8s-app=cilium' --output jsonpath='{.items..metadata.name}') -- $argv
end

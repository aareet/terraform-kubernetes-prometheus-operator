resource "kubernetes_manifest" "serviceaccount_prometheus_operator" {
  provider = kubernetes-alpha

  manifest = {
    "apiVersion" = "v1"
    "kind" = "ServiceAccount"
    "metadata" = {
      "labels" = {
        "app.kubernetes.io/component" = "controller"
        "app.kubernetes.io/name" = "prometheus-operator"
        "app.kubernetes.io/version" = "0.46.0"
      }
      "name" = "prometheus-operator"
      "namespace" = kubernetes_manifest.namespace_prometheus_operator.object.metadata.name
    }
  }
}

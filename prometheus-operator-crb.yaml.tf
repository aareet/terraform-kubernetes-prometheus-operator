resource "kubernetes_manifest" "clusterrolebinding_prometheus_operator" {
  provider = kubernetes-alpha

  manifest = {
    "apiVersion" = "rbac.authorization.k8s.io/v1"
    "kind" = "ClusterRoleBinding"
    "metadata" = {
      "labels" = {
        "app.kubernetes.io/component" = "controller"
        "app.kubernetes.io/name" = "prometheus-operator"
        "app.kubernetes.io/version" = "0.46.0"
      }
      "name" = "prometheus-operator"
    }
    "roleRef" = {
      "apiGroup" = "rbac.authorization.k8s.io"
      "kind" = "ClusterRole"
      "name" = "prometheus-operator"
    }
    "subjects" = [
      {
        "kind" = "ServiceAccount"
        "name" = "prometheus-operator"
        "namespace" = kubernetes_manifest.namespace_prometheus_operator.object.metadata.name
      },
    ]
  }
}

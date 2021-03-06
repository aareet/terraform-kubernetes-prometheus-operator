resource "kubernetes_manifest" "service_prometheus_operator" {
  provider = kubernetes-alpha

  manifest = {
    "apiVersion" = "v1"
    "kind" = "Service"
    "metadata" = {
      "labels" = {
        "app.kubernetes.io/component" = "controller"
        "app.kubernetes.io/name" = "prometheus-operator"
        "app.kubernetes.io/version" = "0.46.0"
      }
      "name" = "prometheus-operator"
      "namespace" = kubernetes_manifest.namespace_prometheus_operator.object.metadata.name
    }
    "spec" = {
      "clusterIP" = "None"
      "ports" = [
        {
          "name" = "http"
          "port" = 8080
          "targetPort" = "http"
"protocol" = "TCP"
        },
      ]
      "selector" = {
        "app.kubernetes.io/component" = "controller"
        "app.kubernetes.io/name" = "prometheus-operator"
      }
    }
  }
}

resource "kubernetes_manifest" "clusterrole_prometheus_operator" {
  provider = kubernetes-alpha

  manifest = {
    "apiVersion" = "rbac.authorization.k8s.io/v1"
    "kind" = "ClusterRole"
    "metadata" = {
      "labels" = {
        "app.kubernetes.io/component" = "controller"
        "app.kubernetes.io/name" = "prometheus-operator"
        "app.kubernetes.io/version" = "0.46.0"
      }
      "name" = "prometheus-operator"
    }
    "rules" = [
      {
        "apiGroups" = [
          "monitoring.coreos.com",
        ]
        "resources" = [
          "alertmanagers",
          "alertmanagers/finalizers",
          "alertmanagerconfigs",
          "prometheuses",
          "prometheuses/finalizers",
          "thanosrulers",
          "thanosrulers/finalizers",
          "servicemonitors",
          "podmonitors",
          "probes",
          "prometheusrules",
        ]
        "verbs" = [
          "*",
        ]
      },
      {
        "apiGroups" = [
          "apps",
        ]
        "resources" = [
          "statefulsets",
        ]
        "verbs" = [
          "*",
        ]
      },
      {
        "apiGroups" = [
          "",
        ]
        "resources" = [
          "configmaps",
          "secrets",
        ]
        "verbs" = [
          "*",
        ]
      },
      {
        "apiGroups" = [
          "",
        ]
        "resources" = [
          "pods",
        ]
        "verbs" = [
          "list",
          "delete",
        ]
      },
      {
        "apiGroups" = [
          "",
        ]
        "resources" = [
          "services",
          "services/finalizers",
          "endpoints",
        ]
        "verbs" = [
          "get",
          "create",
          "update",
          "delete",
        ]
      },
      {
        "apiGroups" = [
          "",
        ]
        "resources" = [
          "nodes",
        ]
        "verbs" = [
          "list",
          "watch",
        ]
      },
      {
        "apiGroups" = [
          "",
        ]
        "resources" = [
          "namespaces",
        ]
        "verbs" = [
          "get",
          "list",
          "watch",
        ]
      },
      {
        "apiGroups" = [
          "networking.k8s.io",
        ]
        "resources" = [
          "ingresses",
        ]
        "verbs" = [
          "get",
          "list",
          "watch",
        ]
      },
    ]
  }
}

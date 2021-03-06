resource "kubernetes_manifest" "deployment_prometheus_operator" {
  provider = kubernetes-alpha

  manifest = {
    "apiVersion" = "apps/v1"
    "kind" = "Deployment"
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
      "replicas" = 1
      "selector" = {
        "matchLabels" = {
          "app.kubernetes.io/component" = "controller"
          "app.kubernetes.io/name" = "prometheus-operator"
        }
      }
      "template" = {
        "metadata" = {
          "labels" = {
            "app.kubernetes.io/component" = "controller"
            "app.kubernetes.io/name" = "prometheus-operator"
            "app.kubernetes.io/version" = "0.46.0"
          }
        }
        "spec" = {
          "containers" = [
            {
              "args" = [
                "--kubelet-service=kube-system/kubelet",
                "--prometheus-config-reloader=quay.io/prometheus-operator/prometheus-config-reloader:v0.46.0",
              ]
              "image" = "quay.io/prometheus-operator/prometheus-operator:v0.46.0"
              "name" = "prometheus-operator"
              "ports" = [
                {
"protocol" = "TCP"
                  "containerPort" = 8080
                  "name" = "http"
                },
              ]
              "resources" = {
                "limits" = {
                  "cpu" = "200m"
                  "memory" = "200Mi"
                }
                "requests" = {
                  "cpu" = "100m"
                  "memory" = "100Mi"
                }
              }
              "securityContext" = {
                "allowPrivilegeEscalation" = false
              }
            },
          ]
          "nodeSelector" = {
            "kubernetes.io/os" = "linux"
          }
          "securityContext" = {
            "runAsNonRoot" = true
            "runAsUser" = 65534
          }
          "serviceAccountName" = "prometheus-operator"
        }
      }
    }
  }
}

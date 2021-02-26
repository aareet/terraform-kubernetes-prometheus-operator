resource "kubernetes_manifest" "customresourcedefinition_alertmanagerconfigs_monitoring_coreos_com" {
  provider = kubernetes-alpha

  manifest = {
    "apiVersion" = "apiextensions.k8s.io/v1"
    "kind" = "CustomResourceDefinition"
    "metadata" = {
      "annotations" = {
        "controller-gen.kubebuilder.io/version" = "v0.4.1"
      }
      "creationTimestamp" = null
      "name" = "alertmanagerconfigs.monitoring.coreos.com"
    }
    "spec" = {
      "group" = "monitoring.coreos.com"
      "names" = {
        "categories" = [
          "prometheus-operator",
        ]
        "kind" = "AlertmanagerConfig"
        "listKind" = "AlertmanagerConfigList"
        "plural" = "alertmanagerconfigs"
        "singular" = "alertmanagerconfig"
      }
      "scope" = "Namespaced"
      "versions" = [
        {
          "name" = "v1alpha1"
          "schema" = {
            "openAPIV3Schema" = {
              "description" = "AlertmanagerConfig defines a namespaced AlertmanagerConfig to be aggregated across multiple namespaces configuring one Alertmanager cluster."
              "properties" = {
                "apiVersion" = {
                  "description" = "APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources"
                  "type" = "string"
                }
                "kind" = {
                  "description" = "Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds"
                  "type" = "string"
                }
                "metadata" = {
                  "type" = "object"
                }
                "spec" = {
                  "description" = "AlertmanagerConfigSpec is a specification of the desired behavior of the Alertmanager configuration. By definition, the Alertmanager configuration only applies to alerts for which the `namespace` label is equal to the namespace of the AlertmanagerConfig resource."
                  "properties" = {
                    "inhibitRules" = {
                      "description" = "List of inhibition rules. The rules will only apply to alerts matching the resource’s namespace."
                      "items" = {
                        "description" = "InhibitRule defines an inhibition rule that allows to mute alerts when other alerts are already firing. See https://prometheus.io/docs/alerting/latest/configuration/#inhibit_rule"
                        "properties" = {
                          "equal" = {
                            "description" = "Labels that must have an equal value in the source and target alert for the inhibition to take effect."
                            "items" = {
                              "type" = "string"
                            }
                            "type" = "array"
                          }
                          "sourceMatch" = {
                            "description" = "Matchers for which one or more alerts have to exist for the inhibition to take effect. The operator enforces that the alert matches the resource’s namespace."
                            "items" = {
                              "description" = "Matcher defines how to match on alert's labels."
                              "properties" = {
                                "name" = {
                                  "description" = "Label to match."
                                  "minLength" = 1
                                  "type" = "string"
                                }
                                "regex" = {
                                  "description" = "Whether to match on equality (false) or regular-expression (true)."
                                  "type" = "boolean"
                                }
                                "value" = {
                                  "description" = "Label value to match."
                                  "type" = "string"
                                }
                              }
                              "required" = [
                                "name",
                              ]
                              "type" = "object"
                            }
                            "type" = "array"
                          }
                          "targetMatch" = {
                            "description" = "Matchers that have to be fulfilled in the alerts to be muted. The operator enforces that the alert matches the resource’s namespace."
                            "items" = {
                              "description" = "Matcher defines how to match on alert's labels."
                              "properties" = {
                                "name" = {
                                  "description" = "Label to match."
                                  "minLength" = 1
                                  "type" = "string"
                                }
                                "regex" = {
                                  "description" = "Whether to match on equality (false) or regular-expression (true)."
                                  "type" = "boolean"
                                }
                                "value" = {
                                  "description" = "Label value to match."
                                  "type" = "string"
                                }
                              }
                              "required" = [
                                "name",
                              ]
                              "type" = "object"
                            }
                            "type" = "array"
                          }
                        }
                        "type" = "object"
                      }
                      "type" = "array"
                    }
                    "receivers" = {
                      "description" = "List of receivers."
                      "items" = {
                        "description" = "Receiver defines one or more notification integrations."
                        "properties" = {
                          "emailConfigs" = {
                            "description" = "List of Email configurations."
                            "items" = {
                              "description" = "EmailConfig configures notifications via Email."
                              "properties" = {
                                "authIdentity" = {
                                  "description" = "The identity to use for authentication."
                                  "type" = "string"
                                }
                                "authPassword" = {
                                  "description" = "The secret's key that contains the password to use for authentication. The secret needs to be in the same namespace as the AlertmanagerConfig object and accessible by the Prometheus Operator."
                                  "properties" = {
                                    "key" = {
                                      "description" = "The key of the secret to select from.  Must be a valid secret key."
                                      "type" = "string"
                                    }
                                    "name" = {
                                      "description" = "Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names TODO: Add other useful fields. apiVersion, kind, uid?"
                                      "type" = "string"
                                    }
                                    "optional" = {
                                      "description" = "Specify whether the Secret or its key must be defined"
                                      "type" = "boolean"
                                    }
                                  }
                                  "required" = [
                                    "key",
                                  ]
                                  "type" = "object"
                                }
                                "authSecret" = {
                                  "description" = "The secret's key that contains the CRAM-MD5 secret. The secret needs to be in the same namespace as the AlertmanagerConfig object and accessible by the Prometheus Operator."
                                  "properties" = {
                                    "key" = {
                                      "description" = "The key of the secret to select from.  Must be a valid secret key."
                                      "type" = "string"
                                    }
                                    "name" = {
                                      "description" = "Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names TODO: Add other useful fields. apiVersion, kind, uid?"
                                      "type" = "string"
                                    }
                                    "optional" = {
                                      "description" = "Specify whether the Secret or its key must be defined"
                                      "type" = "boolean"
                                    }
                                  }
                                  "required" = [
                                    "key",
                                  ]
                                  "type" = "object"
                                }
                                "authUsername" = {
                                  "description" = "The username to use for authentication."
                                  "type" = "string"
                                }
                                "from" = {
                                  "description" = "The sender address."
                                  "type" = "string"
                                }
                                "headers" = {
                                  "description" = "Further headers email header key/value pairs. Overrides any headers previously set by the notification implementation."
                                  "items" = {
                                    "description" = "KeyValue defines a (key, value) tuple."
                                    "properties" = {
                                      "key" = {
                                        "description" = "Key of the tuple."
                                        "minLength" = 1
                                        "type" = "string"
                                      }
                                      "value" = {
                                        "description" = "Value of the tuple."
                                        "type" = "string"
                                      }
                                    }
                                    "required" = [
                                      "key",
                                      "value",
                                    ]
                                    "type" = "object"
                                  }
                                  "type" = "array"
                                }
                                "hello" = {
                                  "description" = "The hostname to identify to the SMTP server."
                                  "type" = "string"
                                }
                                "html" = {
                                  "description" = "The HTML body of the email notification."
                                  "type" = "string"
                                }
                                "requireTLS" = {
                                  "description" = "The SMTP TLS requirement. Note that Go does not support unencrypted connections to remote SMTP endpoints."
                                  "type" = "boolean"
                                }
                                "sendResolved" = {
                                  "description" = "Whether or not to notify about resolved alerts."
                                  "type" = "boolean"
                                }
                                "smarthost" = {
                                  "description" = "The SMTP host through which emails are sent."
                                  "type" = "string"
                                }
                                "text" = {
                                  "description" = "The text body of the email notification."
                                  "type" = "string"
                                }
                                "tlsConfig" = {
                                  "description" = "TLS configuration"
                                  "properties" = {
                                    "ca" = {
                                      "description" = "Struct containing the CA cert to use for the targets."
                                      "properties" = {
                                        "configMap" = {
                                          "description" = "ConfigMap containing data to use for the targets."
                                          "properties" = {
                                            "key" = {
                                              "description" = "The key to select."
                                              "type" = "string"
                                            }
                                            "name" = {
                                              "description" = "Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names TODO: Add other useful fields. apiVersion, kind, uid?"
                                              "type" = "string"
                                            }
                                            "optional" = {
                                              "description" = "Specify whether the ConfigMap or its key must be defined"
                                              "type" = "boolean"
                                            }
                                          }
                                          "required" = [
                                            "key",
                                          ]
                                          "type" = "object"
                                        }
                                        "secret" = {
                                          "description" = "Secret containing data to use for the targets."
                                          "properties" = {
                                            "key" = {
                                              "description" = "The key of the secret to select from.  Must be a valid secret key."
                                              "type" = "string"
                                            }
                                            "name" = {
                                              "description" = "Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names TODO: Add other useful fields. apiVersion, kind, uid?"
                                              "type" = "string"
                                            }
                                            "optional" = {
                                              "description" = "Specify whether the Secret or its key must be defined"
                                              "type" = "boolean"
                                            }
                                          }
                                          "required" = [
                                            "key",
                                          ]
                                          "type" = "object"
                                        }
                                      }
                                      "type" = "object"
                                    }
                                    "cert" = {
                                      "description" = "Struct containing the client cert file for the targets."
                                      "properties" = {
                                        "configMap" = {
                                          "description" = "ConfigMap containing data to use for the targets."
                                          "properties" = {
                                            "key" = {
                                              "description" = "The key to select."
                                              "type" = "string"
                                            }
                                            "name" = {
                                              "description" = "Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names TODO: Add other useful fields. apiVersion, kind, uid?"
                                              "type" = "string"
                                            }
                                            "optional" = {
                                              "description" = "Specify whether the ConfigMap or its key must be defined"
                                              "type" = "boolean"
                                            }
                                          }
                                          "required" = [
                                            "key",
                                          ]
                                          "type" = "object"
                                        }
                                        "secret" = {
                                          "description" = "Secret containing data to use for the targets."
                                          "properties" = {
                                            "key" = {
                                              "description" = "The key of the secret to select from.  Must be a valid secret key."
                                              "type" = "string"
                                            }
                                            "name" = {
                                              "description" = "Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names TODO: Add other useful fields. apiVersion, kind, uid?"
                                              "type" = "string"
                                            }
                                            "optional" = {
                                              "description" = "Specify whether the Secret or its key must be defined"
                                              "type" = "boolean"
                                            }
                                          }
                                          "required" = [
                                            "key",
                                          ]
                                          "type" = "object"
                                        }
                                      }
                                      "type" = "object"
                                    }
                                    "insecureSkipVerify" = {
                                      "description" = "Disable target certificate validation."
                                      "type" = "boolean"
                                    }
                                    "keySecret" = {
                                      "description" = "Secret containing the client key file for the targets."
                                      "properties" = {
                                        "key" = {
                                          "description" = "The key of the secret to select from.  Must be a valid secret key."
                                          "type" = "string"
                                        }
                                        "name" = {
                                          "description" = "Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names TODO: Add other useful fields. apiVersion, kind, uid?"
                                          "type" = "string"
                                        }
                                        "optional" = {
                                          "description" = "Specify whether the Secret or its key must be defined"
                                          "type" = "boolean"
                                        }
                                      }
                                      "required" = [
                                        "key",
                                      ]
                                      "type" = "object"
                                    }
                                    "serverName" = {
                                      "description" = "Used to verify the hostname for the targets."
                                      "type" = "string"
                                    }
                                  }
                                  "type" = "object"
                                }
                                "to" = {
                                  "description" = "The email address to send notifications to."
                                  "type" = "string"
                                }
                              }
                              "type" = "object"
                            }
                            "type" = "array"
                          }
                          "name" = {
                            "description" = "Name of the receiver. Must be unique across all items from the list."
                            "minLength" = 1
                            "type" = "string"
                          }
                          "opsgenieConfigs" = {
                            "description" = "List of OpsGenie configurations."
                            "items" = {
                              "description" = "OpsGenieConfig configures notifications via OpsGenie. See https://prometheus.io/docs/alerting/latest/configuration/#opsgenie_config"
                              "properties" = {
                                "apiKey" = {
                                  "description" = "The secret's key that contains the OpsGenie API key. The secret needs to be in the same namespace as the AlertmanagerConfig object and accessible by the Prometheus Operator."
                                  "properties" = {
                                    "key" = {
                                      "description" = "The key of the secret to select from.  Must be a valid secret key."
                                      "type" = "string"
                                    }
                                    "name" = {
                                      "description" = "Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names TODO: Add other useful fields. apiVersion, kind, uid?"
                                      "type" = "string"
                                    }
                                    "optional" = {
                                      "description" = "Specify whether the Secret or its key must be defined"
                                      "type" = "boolean"
                                    }
                                  }
                                  "required" = [
                                    "key",
                                  ]
                                  "type" = "object"
                                }
                                "apiURL" = {
                                  "description" = "The URL to send OpsGenie API requests to."
                                  "type" = "string"
                                }
                                "description" = {
                                  "description" = "Description of the incident."
                                  "type" = "string"
                                }
                                "details" = {
                                  "description" = "A set of arbitrary key/value pairs that provide further detail about the incident."
                                  "items" = {
                                    "description" = "KeyValue defines a (key, value) tuple."
                                    "properties" = {
                                      "key" = {
                                        "description" = "Key of the tuple."
                                        "minLength" = 1
                                        "type" = "string"
                                      }
                                      "value" = {
                                        "description" = "Value of the tuple."
                                        "type" = "string"
                                      }
                                    }
                                    "required" = [
                                      "key",
                                      "value",
                                    ]
                                    "type" = "object"
                                  }
                                  "type" = "array"
                                }
                                "httpConfig" = {
                                  "description" = "HTTP client configuration."
                                  "properties" = {
                                    "basicAuth" = {
                                      "description" = "BasicAuth for the client."
                                      "properties" = {
                                        "password" = {
                                          "description" = "The secret in the service monitor namespace that contains the password for authentication."
                                          "properties" = {
                                            "key" = {
                                              "description" = "The key of the secret to select from.  Must be a valid secret key."
                                              "type" = "string"
                                            }
                                            "name" = {
                                              "description" = "Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names TODO: Add other useful fields. apiVersion, kind, uid?"
                                              "type" = "string"
                                            }
                                            "optional" = {
                                              "description" = "Specify whether the Secret or its key must be defined"
                                              "type" = "boolean"
                                            }
                                          }
                                          "required" = [
                                            "key",
                                          ]
                                          "type" = "object"
                                        }
                                        "username" = {
                                          "description" = "The secret in the service monitor namespace that contains the username for authentication."
                                          "properties" = {
                                            "key" = {
                                              "description" = "The key of the secret to select from.  Must be a valid secret key."
                                              "type" = "string"
                                            }
                                            "name" = {
                                              "description" = "Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names TODO: Add other useful fields. apiVersion, kind, uid?"
                                              "type" = "string"
                                            }
                                            "optional" = {
                                              "description" = "Specify whether the Secret or its key must be defined"
                                              "type" = "boolean"
                                            }
                                          }
                                          "required" = [
                                            "key",
                                          ]
                                          "type" = "object"
                                        }
                                      }
                                      "type" = "object"
                                    }
                                    "bearerTokenSecret" = {
                                      "description" = "The secret's key that contains the bearer token to be used by the client for authentication. The secret needs to be in the same namespace as the AlertmanagerConfig object and accessible by the Prometheus Operator."
                                      "properties" = {
                                        "key" = {
                                          "description" = "The key of the secret to select from.  Must be a valid secret key."
                                          "type" = "string"
                                        }
                                        "name" = {
                                          "description" = "Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names TODO: Add other useful fields. apiVersion, kind, uid?"
                                          "type" = "string"
                                        }
                                        "optional" = {
                                          "description" = "Specify whether the Secret or its key must be defined"
                                          "type" = "boolean"
                                        }
                                      }
                                      "required" = [
                                        "key",
                                      ]
                                      "type" = "object"
                                    }
                                    "proxyURL" = {
                                      "description" = "Optional proxy URL."
                                      "type" = "string"
                                    }
                                    "tlsConfig" = {
                                      "description" = "TLS configuration for the client."
                                      "properties" = {
                                        "ca" = {
                                          "description" = "Struct containing the CA cert to use for the targets."
                                          "properties" = {
                                            "configMap" = {
                                              "description" = "ConfigMap containing data to use for the targets."
                                              "properties" = {
                                                "key" = {
                                                  "description" = "The key to select."
                                                  "type" = "string"
                                                }
                                                "name" = {
                                                  "description" = "Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names TODO: Add other useful fields. apiVersion, kind, uid?"
                                                  "type" = "string"
                                                }
                                                "optional" = {
                                                  "description" = "Specify whether the ConfigMap or its key must be defined"
                                                  "type" = "boolean"
                                                }
                                              }
                                              "required" = [
                                                "key",
                                              ]
                                              "type" = "object"
                                            }
                                            "secret" = {
                                              "description" = "Secret containing data to use for the targets."
                                              "properties" = {
                                                "key" = {
                                                  "description" = "The key of the secret to select from.  Must be a valid secret key."
                                                  "type" = "string"
                                                }
                                                "name" = {
                                                  "description" = "Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names TODO: Add other useful fields. apiVersion, kind, uid?"
                                                  "type" = "string"
                                                }
                                                "optional" = {
                                                  "description" = "Specify whether the Secret or its key must be defined"
                                                  "type" = "boolean"
                                                }
                                              }
                                              "required" = [
                                                "key",
                                              ]
                                              "type" = "object"
                                            }
                                          }
                                          "type" = "object"
                                        }
                                        "cert" = {
                                          "description" = "Struct containing the client cert file for the targets."
                                          "properties" = {
                                            "configMap" = {
                                              "description" = "ConfigMap containing data to use for the targets."
                                              "properties" = {
                                                "key" = {
                                                  "description" = "The key to select."
                                                  "type" = "string"
                                                }
                                                "name" = {
                                                  "description" = "Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names TODO: Add other useful fields. apiVersion, kind, uid?"
                                                  "type" = "string"
                                                }
                                                "optional" = {
                                                  "description" = "Specify whether the ConfigMap or its key must be defined"
                                                  "type" = "boolean"
                                                }
                                              }
                                              "required" = [
                                                "key",
                                              ]
                                              "type" = "object"
                                            }
                                            "secret" = {
                                              "description" = "Secret containing data to use for the targets."
                                              "properties" = {
                                                "key" = {
                                                  "description" = "The key of the secret to select from.  Must be a valid secret key."
                                                  "type" = "string"
                                                }
                                                "name" = {
                                                  "description" = "Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names TODO: Add other useful fields. apiVersion, kind, uid?"
                                                  "type" = "string"
                                                }
                                                "optional" = {
                                                  "description" = "Specify whether the Secret or its key must be defined"
                                                  "type" = "boolean"
                                                }
                                              }
                                              "required" = [
                                                "key",
                                              ]
                                              "type" = "object"
                                            }
                                          }
                                          "type" = "object"
                                        }
                                        "insecureSkipVerify" = {
                                          "description" = "Disable target certificate validation."
                                          "type" = "boolean"
                                        }
                                        "keySecret" = {
                                          "description" = "Secret containing the client key file for the targets."
                                          "properties" = {
                                            "key" = {
                                              "description" = "The key of the secret to select from.  Must be a valid secret key."
                                              "type" = "string"
                                            }
                                            "name" = {
                                              "description" = "Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names TODO: Add other useful fields. apiVersion, kind, uid?"
                                              "type" = "string"
                                            }
                                            "optional" = {
                                              "description" = "Specify whether the Secret or its key must be defined"
                                              "type" = "boolean"
                                            }
                                          }
                                          "required" = [
                                            "key",
                                          ]
                                          "type" = "object"
                                        }
                                        "serverName" = {
                                          "description" = "Used to verify the hostname for the targets."
                                          "type" = "string"
                                        }
                                      }
                                      "type" = "object"
                                    }
                                  }
                                  "type" = "object"
                                }
                                "message" = {
                                  "description" = "Alert text limited to 130 characters."
                                  "type" = "string"
                                }
                                "note" = {
                                  "description" = "Additional alert note."
                                  "type" = "string"
                                }
                                "priority" = {
                                  "description" = "Priority level of alert. Possible values are P1, P2, P3, P4, and P5."
                                  "type" = "string"
                                }
                                "responders" = {
                                  "description" = "List of responders responsible for notifications."
                                  "items" = {
                                    "description" = "OpsGenieConfigResponder defines a responder to an incident. One of `id`, `name` or `username` has to be defined."
                                    "properties" = {
                                      "id" = {
                                        "description" = "ID of the responder."
                                        "type" = "string"
                                      }
                                      "name" = {
                                        "description" = "Name of the responder."
                                        "type" = "string"
                                      }
                                      "type" = {
                                        "description" = "Type of responder."
                                        "minLength" = 1
                                        "type" = "string"
                                      }
                                      "username" = {
                                        "description" = "Username of the responder."
                                        "type" = "string"
                                      }
                                    }
                                    "required" = [
                                      "type",
                                    ]
                                    "type" = "object"
                                  }
                                  "type" = "array"
                                }
                                "sendResolved" = {
                                  "description" = "Whether or not to notify about resolved alerts."
                                  "type" = "boolean"
                                }
                                "source" = {
                                  "description" = "Backlink to the sender of the notification."
                                  "type" = "string"
                                }
                                "tags" = {
                                  "description" = "Comma separated list of tags attached to the notifications."
                                  "type" = "string"
                                }
                              }
                              "type" = "object"
                            }
                            "type" = "array"
                          }
                          "pagerdutyConfigs" = {
                            "description" = "List of PagerDuty configurations."
                            "items" = {
                              "description" = "PagerDutyConfig configures notifications via PagerDuty. See https://prometheus.io/docs/alerting/latest/configuration/#pagerduty_config"
                              "properties" = {
                                "class" = {
                                  "description" = "The class/type of the event."
                                  "type" = "string"
                                }
                                "client" = {
                                  "description" = "Client identification."
                                  "type" = "string"
                                }
                                "clientURL" = {
                                  "description" = "Backlink to the sender of notification."
                                  "type" = "string"
                                }
                                "component" = {
                                  "description" = "The part or component of the affected system that is broken."
                                  "type" = "string"
                                }
                                "description" = {
                                  "description" = "Description of the incident."
                                  "type" = "string"
                                }
                                "details" = {
                                  "description" = "Arbitrary key/value pairs that provide further detail about the incident."
                                  "items" = {
                                    "description" = "KeyValue defines a (key, value) tuple."
                                    "properties" = {
                                      "key" = {
                                        "description" = "Key of the tuple."
                                        "minLength" = 1
                                        "type" = "string"
                                      }
                                      "value" = {
                                        "description" = "Value of the tuple."
                                        "type" = "string"
                                      }
                                    }
                                    "required" = [
                                      "key",
                                      "value",
                                    ]
                                    "type" = "object"
                                  }
                                  "type" = "array"
                                }
                                "group" = {
                                  "description" = "A cluster or grouping of sources."
                                  "type" = "string"
                                }
                                "httpConfig" = {
                                  "description" = "HTTP client configuration."
                                  "properties" = {
                                    "basicAuth" = {
                                      "description" = "BasicAuth for the client."
                                      "properties" = {
                                        "password" = {
                                          "description" = "The secret in the service monitor namespace that contains the password for authentication."
                                          "properties" = {
                                            "key" = {
                                              "description" = "The key of the secret to select from.  Must be a valid secret key."
                                              "type" = "string"
                                            }
                                            "name" = {
                                              "description" = "Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names TODO: Add other useful fields. apiVersion, kind, uid?"
                                              "type" = "string"
                                            }
                                            "optional" = {
                                              "description" = "Specify whether the Secret or its key must be defined"
                                              "type" = "boolean"
                                            }
                                          }
                                          "required" = [
                                            "key",
                                          ]
                                          "type" = "object"
                                        }
                                        "username" = {
                                          "description" = "The secret in the service monitor namespace that contains the username for authentication."
                                          "properties" = {
                                            "key" = {
                                              "description" = "The key of the secret to select from.  Must be a valid secret key."
                                              "type" = "string"
                                            }
                                            "name" = {
                                              "description" = "Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names TODO: Add other useful fields. apiVersion, kind, uid?"
                                              "type" = "string"
                                            }
                                            "optional" = {
                                              "description" = "Specify whether the Secret or its key must be defined"
                                              "type" = "boolean"
                                            }
                                          }
                                          "required" = [
                                            "key",
                                          ]
                                          "type" = "object"
                                        }
                                      }
                                      "type" = "object"
                                    }
                                    "bearerTokenSecret" = {
                                      "description" = "The secret's key that contains the bearer token to be used by the client for authentication. The secret needs to be in the same namespace as the AlertmanagerConfig object and accessible by the Prometheus Operator."
                                      "properties" = {
                                        "key" = {
                                          "description" = "The key of the secret to select from.  Must be a valid secret key."
                                          "type" = "string"
                                        }
                                        "name" = {
                                          "description" = "Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names TODO: Add other useful fields. apiVersion, kind, uid?"
                                          "type" = "string"
                                        }
                                        "optional" = {
                                          "description" = "Specify whether the Secret or its key must be defined"
                                          "type" = "boolean"
                                        }
                                      }
                                      "required" = [
                                        "key",
                                      ]
                                      "type" = "object"
                                    }
                                    "proxyURL" = {
                                      "description" = "Optional proxy URL."
                                      "type" = "string"
                                    }
                                    "tlsConfig" = {
                                      "description" = "TLS configuration for the client."
                                      "properties" = {
                                        "ca" = {
                                          "description" = "Struct containing the CA cert to use for the targets."
                                          "properties" = {
                                            "configMap" = {
                                              "description" = "ConfigMap containing data to use for the targets."
                                              "properties" = {
                                                "key" = {
                                                  "description" = "The key to select."
                                                  "type" = "string"
                                                }
                                                "name" = {
                                                  "description" = "Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names TODO: Add other useful fields. apiVersion, kind, uid?"
                                                  "type" = "string"
                                                }
                                                "optional" = {
                                                  "description" = "Specify whether the ConfigMap or its key must be defined"
                                                  "type" = "boolean"
                                                }
                                              }
                                              "required" = [
                                                "key",
                                              ]
                                              "type" = "object"
                                            }
                                            "secret" = {
                                              "description" = "Secret containing data to use for the targets."
                                              "properties" = {
                                                "key" = {
                                                  "description" = "The key of the secret to select from.  Must be a valid secret key."
                                                  "type" = "string"
                                                }
                                                "name" = {
                                                  "description" = "Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names TODO: Add other useful fields. apiVersion, kind, uid?"
                                                  "type" = "string"
                                                }
                                                "optional" = {
                                                  "description" = "Specify whether the Secret or its key must be defined"
                                                  "type" = "boolean"
                                                }
                                              }
                                              "required" = [
                                                "key",
                                              ]
                                              "type" = "object"
                                            }
                                          }
                                          "type" = "object"
                                        }
                                        "cert" = {
                                          "description" = "Struct containing the client cert file for the targets."
                                          "properties" = {
                                            "configMap" = {
                                              "description" = "ConfigMap containing data to use for the targets."
                                              "properties" = {
                                                "key" = {
                                                  "description" = "The key to select."
                                                  "type" = "string"
                                                }
                                                "name" = {
                                                  "description" = "Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names TODO: Add other useful fields. apiVersion, kind, uid?"
                                                  "type" = "string"
                                                }
                                                "optional" = {
                                                  "description" = "Specify whether the ConfigMap or its key must be defined"
                                                  "type" = "boolean"
                                                }
                                              }
                                              "required" = [
                                                "key",
                                              ]
                                              "type" = "object"
                                            }
                                            "secret" = {
                                              "description" = "Secret containing data to use for the targets."
                                              "properties" = {
                                                "key" = {
                                                  "description" = "The key of the secret to select from.  Must be a valid secret key."
                                                  "type" = "string"
                                                }
                                                "name" = {
                                                  "description" = "Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names TODO: Add other useful fields. apiVersion, kind, uid?"
                                                  "type" = "string"
                                                }
                                                "optional" = {
                                                  "description" = "Specify whether the Secret or its key must be defined"
                                                  "type" = "boolean"
                                                }
                                              }
                                              "required" = [
                                                "key",
                                              ]
                                              "type" = "object"
                                            }
                                          }
                                          "type" = "object"
                                        }
                                        "insecureSkipVerify" = {
                                          "description" = "Disable target certificate validation."
                                          "type" = "boolean"
                                        }
                                        "keySecret" = {
                                          "description" = "Secret containing the client key file for the targets."
                                          "properties" = {
                                            "key" = {
                                              "description" = "The key of the secret to select from.  Must be a valid secret key."
                                              "type" = "string"
                                            }
                                            "name" = {
                                              "description" = "Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names TODO: Add other useful fields. apiVersion, kind, uid?"
                                              "type" = "string"
                                            }
                                            "optional" = {
                                              "description" = "Specify whether the Secret or its key must be defined"
                                              "type" = "boolean"
                                            }
                                          }
                                          "required" = [
                                            "key",
                                          ]
                                          "type" = "object"
                                        }
                                        "serverName" = {
                                          "description" = "Used to verify the hostname for the targets."
                                          "type" = "string"
                                        }
                                      }
                                      "type" = "object"
                                    }
                                  }
                                  "type" = "object"
                                }
                                "routingKey" = {
                                  "description" = "The secret's key that contains the PagerDuty integration key (when using Events API v2). Either this field or `serviceKey` needs to be defined. The secret needs to be in the same namespace as the AlertmanagerConfig object and accessible by the Prometheus Operator."
                                  "properties" = {
                                    "key" = {
                                      "description" = "The key of the secret to select from.  Must be a valid secret key."
                                      "type" = "string"
                                    }
                                    "name" = {
                                      "description" = "Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names TODO: Add other useful fields. apiVersion, kind, uid?"
                                      "type" = "string"
                                    }
                                    "optional" = {
                                      "description" = "Specify whether the Secret or its key must be defined"
                                      "type" = "boolean"
                                    }
                                  }
                                  "required" = [
                                    "key",
                                  ]
                                  "type" = "object"
                                }
                                "sendResolved" = {
                                  "description" = "Whether or not to notify about resolved alerts."
                                  "type" = "boolean"
                                }
                                "serviceKey" = {
                                  "description" = "The secret's key that contains the PagerDuty service key (when using integration type \"Prometheus\"). Either this field or `routingKey` needs to be defined. The secret needs to be in the same namespace as the AlertmanagerConfig object and accessible by the Prometheus Operator."
                                  "properties" = {
                                    "key" = {
                                      "description" = "The key of the secret to select from.  Must be a valid secret key."
                                      "type" = "string"
                                    }
                                    "name" = {
                                      "description" = "Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names TODO: Add other useful fields. apiVersion, kind, uid?"
                                      "type" = "string"
                                    }
                                    "optional" = {
                                      "description" = "Specify whether the Secret or its key must be defined"
                                      "type" = "boolean"
                                    }
                                  }
                                  "required" = [
                                    "key",
                                  ]
                                  "type" = "object"
                                }
                                "severity" = {
                                  "description" = "Severity of the incident."
                                  "type" = "string"
                                }
                                "url" = {
                                  "description" = "The URL to send requests to."
                                  "type" = "string"
                                }
                              }
                              "type" = "object"
                            }
                            "type" = "array"
                          }
                          "pushoverConfigs" = {
                            "description" = "List of Pushover configurations."
                            "items" = {
                              "description" = "PushoverConfig configures notifications via Pushover. See https://prometheus.io/docs/alerting/latest/configuration/#pushover_config"
                              "properties" = {
                                "expire" = {
                                  "description" = "How long your notification will continue to be retried for, unless the user acknowledges the notification."
                                  "type" = "string"
                                }
                                "html" = {
                                  "description" = "Whether notification message is HTML or plain text."
                                  "type" = "boolean"
                                }
                                "httpConfig" = {
                                  "description" = "HTTP client configuration."
                                  "properties" = {
                                    "basicAuth" = {
                                      "description" = "BasicAuth for the client."
                                      "properties" = {
                                        "password" = {
                                          "description" = "The secret in the service monitor namespace that contains the password for authentication."
                                          "properties" = {
                                            "key" = {
                                              "description" = "The key of the secret to select from.  Must be a valid secret key."
                                              "type" = "string"
                                            }
                                            "name" = {
                                              "description" = "Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names TODO: Add other useful fields. apiVersion, kind, uid?"
                                              "type" = "string"
                                            }
                                            "optional" = {
                                              "description" = "Specify whether the Secret or its key must be defined"
                                              "type" = "boolean"
                                            }
                                          }
                                          "required" = [
                                            "key",
                                          ]
                                          "type" = "object"
                                        }
                                        "username" = {
                                          "description" = "The secret in the service monitor namespace that contains the username for authentication."
                                          "properties" = {
                                            "key" = {
                                              "description" = "The key of the secret to select from.  Must be a valid secret key."
                                              "type" = "string"
                                            }
                                            "name" = {
                                              "description" = "Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names TODO: Add other useful fields. apiVersion, kind, uid?"
                                              "type" = "string"
                                            }
                                            "optional" = {
                                              "description" = "Specify whether the Secret or its key must be defined"
                                              "type" = "boolean"
                                            }
                                          }
                                          "required" = [
                                            "key",
                                          ]
                                          "type" = "object"
                                        }
                                      }
                                      "type" = "object"
                                    }
                                    "bearerTokenSecret" = {
                                      "description" = "The secret's key that contains the bearer token to be used by the client for authentication. The secret needs to be in the same namespace as the AlertmanagerConfig object and accessible by the Prometheus Operator."
                                      "properties" = {
                                        "key" = {
                                          "description" = "The key of the secret to select from.  Must be a valid secret key."
                                          "type" = "string"
                                        }
                                        "name" = {
                                          "description" = "Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names TODO: Add other useful fields. apiVersion, kind, uid?"
                                          "type" = "string"
                                        }
                                        "optional" = {
                                          "description" = "Specify whether the Secret or its key must be defined"
                                          "type" = "boolean"
                                        }
                                      }
                                      "required" = [
                                        "key",
                                      ]
                                      "type" = "object"
                                    }
                                    "proxyURL" = {
                                      "description" = "Optional proxy URL."
                                      "type" = "string"
                                    }
                                    "tlsConfig" = {
                                      "description" = "TLS configuration for the client."
                                      "properties" = {
                                        "ca" = {
                                          "description" = "Struct containing the CA cert to use for the targets."
                                          "properties" = {
                                            "configMap" = {
                                              "description" = "ConfigMap containing data to use for the targets."
                                              "properties" = {
                                                "key" = {
                                                  "description" = "The key to select."
                                                  "type" = "string"
                                                }
                                                "name" = {
                                                  "description" = "Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names TODO: Add other useful fields. apiVersion, kind, uid?"
                                                  "type" = "string"
                                                }
                                                "optional" = {
                                                  "description" = "Specify whether the ConfigMap or its key must be defined"
                                                  "type" = "boolean"
                                                }
                                              }
                                              "required" = [
                                                "key",
                                              ]
                                              "type" = "object"
                                            }
                                            "secret" = {
                                              "description" = "Secret containing data to use for the targets."
                                              "properties" = {
                                                "key" = {
                                                  "description" = "The key of the secret to select from.  Must be a valid secret key."
                                                  "type" = "string"
                                                }
                                                "name" = {
                                                  "description" = "Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names TODO: Add other useful fields. apiVersion, kind, uid?"
                                                  "type" = "string"
                                                }
                                                "optional" = {
                                                  "description" = "Specify whether the Secret or its key must be defined"
                                                  "type" = "boolean"
                                                }
                                              }
                                              "required" = [
                                                "key",
                                              ]
                                              "type" = "object"
                                            }
                                          }
                                          "type" = "object"
                                        }
                                        "cert" = {
                                          "description" = "Struct containing the client cert file for the targets."
                                          "properties" = {
                                            "configMap" = {
                                              "description" = "ConfigMap containing data to use for the targets."
                                              "properties" = {
                                                "key" = {
                                                  "description" = "The key to select."
                                                  "type" = "string"
                                                }
                                                "name" = {
                                                  "description" = "Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names TODO: Add other useful fields. apiVersion, kind, uid?"
                                                  "type" = "string"
                                                }
                                                "optional" = {
                                                  "description" = "Specify whether the ConfigMap or its key must be defined"
                                                  "type" = "boolean"
                                                }
                                              }
                                              "required" = [
                                                "key",
                                              ]
                                              "type" = "object"
                                            }
                                            "secret" = {
                                              "description" = "Secret containing data to use for the targets."
                                              "properties" = {
                                                "key" = {
                                                  "description" = "The key of the secret to select from.  Must be a valid secret key."
                                                  "type" = "string"
                                                }
                                                "name" = {
                                                  "description" = "Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names TODO: Add other useful fields. apiVersion, kind, uid?"
                                                  "type" = "string"
                                                }
                                                "optional" = {
                                                  "description" = "Specify whether the Secret or its key must be defined"
                                                  "type" = "boolean"
                                                }
                                              }
                                              "required" = [
                                                "key",
                                              ]
                                              "type" = "object"
                                            }
                                          }
                                          "type" = "object"
                                        }
                                        "insecureSkipVerify" = {
                                          "description" = "Disable target certificate validation."
                                          "type" = "boolean"
                                        }
                                        "keySecret" = {
                                          "description" = "Secret containing the client key file for the targets."
                                          "properties" = {
                                            "key" = {
                                              "description" = "The key of the secret to select from.  Must be a valid secret key."
                                              "type" = "string"
                                            }
                                            "name" = {
                                              "description" = "Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names TODO: Add other useful fields. apiVersion, kind, uid?"
                                              "type" = "string"
                                            }
                                            "optional" = {
                                              "description" = "Specify whether the Secret or its key must be defined"
                                              "type" = "boolean"
                                            }
                                          }
                                          "required" = [
                                            "key",
                                          ]
                                          "type" = "object"
                                        }
                                        "serverName" = {
                                          "description" = "Used to verify the hostname for the targets."
                                          "type" = "string"
                                        }
                                      }
                                      "type" = "object"
                                    }
                                  }
                                  "type" = "object"
                                }
                                "message" = {
                                  "description" = "Notification message."
                                  "type" = "string"
                                }
                                "priority" = {
                                  "description" = "Priority, see https://pushover.net/api#priority"
                                  "type" = "string"
                                }
                                "retry" = {
                                  "description" = "How often the Pushover servers will send the same notification to the user. Must be at least 30 seconds."
                                  "type" = "string"
                                }
                                "sendResolved" = {
                                  "description" = "Whether or not to notify about resolved alerts."
                                  "type" = "boolean"
                                }
                                "sound" = {
                                  "description" = "The name of one of the sounds supported by device clients to override the user's default sound choice"
                                  "type" = "string"
                                }
                                "title" = {
                                  "description" = "Notification title."
                                  "type" = "string"
                                }
                                "token" = {
                                  "description" = "The secret's key that contains the registered application’s API token, see https://pushover.net/apps. The secret needs to be in the same namespace as the AlertmanagerConfig object and accessible by the Prometheus Operator."
                                  "properties" = {
                                    "key" = {
                                      "description" = "The key of the secret to select from.  Must be a valid secret key."
                                      "type" = "string"
                                    }
                                    "name" = {
                                      "description" = "Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names TODO: Add other useful fields. apiVersion, kind, uid?"
                                      "type" = "string"
                                    }
                                    "optional" = {
                                      "description" = "Specify whether the Secret or its key must be defined"
                                      "type" = "boolean"
                                    }
                                  }
                                  "required" = [
                                    "key",
                                  ]
                                  "type" = "object"
                                }
                                "url" = {
                                  "description" = "A supplementary URL shown alongside the message."
                                  "type" = "string"
                                }
                                "urlTitle" = {
                                  "description" = "A title for supplementary URL, otherwise just the URL is shown"
                                  "type" = "string"
                                }
                                "userKey" = {
                                  "description" = "The secret's key that contains the recipient user’s user key. The secret needs to be in the same namespace as the AlertmanagerConfig object and accessible by the Prometheus Operator."
                                  "properties" = {
                                    "key" = {
                                      "description" = "The key of the secret to select from.  Must be a valid secret key."
                                      "type" = "string"
                                    }
                                    "name" = {
                                      "description" = "Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names TODO: Add other useful fields. apiVersion, kind, uid?"
                                      "type" = "string"
                                    }
                                    "optional" = {
                                      "description" = "Specify whether the Secret or its key must be defined"
                                      "type" = "boolean"
                                    }
                                  }
                                  "required" = [
                                    "key",
                                  ]
                                  "type" = "object"
                                }
                              }
                              "type" = "object"
                            }
                            "type" = "array"
                          }
                          "slackConfigs" = {
                            "description" = "List of Slack configurations."
                            "items" = {
                              "description" = "SlackConfig configures notifications via Slack. See https://prometheus.io/docs/alerting/latest/configuration/#slack_config"
                              "properties" = {
                                "actions" = {
                                  "description" = "A list of Slack actions that are sent with each notification."
                                  "items" = {
                                    "description" = "SlackAction configures a single Slack action that is sent with each notification. See https://api.slack.com/docs/message-attachments#action_fields and https://api.slack.com/docs/message-buttons for more information."
                                    "properties" = {
                                      "confirm" = {
                                        "description" = "SlackConfirmationField protect users from destructive actions or particularly distinguished decisions by asking them to confirm their button click one more time. See https://api.slack.com/docs/interactive-message-field-guide#confirmation_fields for more information."
                                        "properties" = {
                                          "dismissText" = {
                                            "type" = "string"
                                          }
                                          "okText" = {
                                            "type" = "string"
                                          }
                                          "text" = {
                                            "minLength" = 1
                                            "type" = "string"
                                          }
                                          "title" = {
                                            "type" = "string"
                                          }
                                        }
                                        "required" = [
                                          "text",
                                        ]
                                        "type" = "object"
                                      }
                                      "name" = {
                                        "type" = "string"
                                      }
                                      "style" = {
                                        "type" = "string"
                                      }
                                      "text" = {
                                        "minLength" = 1
                                        "type" = "string"
                                      }
                                      "type" = {
                                        "minLength" = 1
                                        "type" = "string"
                                      }
                                      "url" = {
                                        "type" = "string"
                                      }
                                      "value" = {
                                        "type" = "string"
                                      }
                                    }
                                    "required" = [
                                      "text",
                                      "type",
                                    ]
                                    "type" = "object"
                                  }
                                  "type" = "array"
                                }
                                "apiURL" = {
                                  "description" = "The secret's key that contains the Slack webhook URL. The secret needs to be in the same namespace as the AlertmanagerConfig object and accessible by the Prometheus Operator."
                                  "properties" = {
                                    "key" = {
                                      "description" = "The key of the secret to select from.  Must be a valid secret key."
                                      "type" = "string"
                                    }
                                    "name" = {
                                      "description" = "Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names TODO: Add other useful fields. apiVersion, kind, uid?"
                                      "type" = "string"
                                    }
                                    "optional" = {
                                      "description" = "Specify whether the Secret or its key must be defined"
                                      "type" = "boolean"
                                    }
                                  }
                                  "required" = [
                                    "key",
                                  ]
                                  "type" = "object"
                                }
                                "callbackId" = {
                                  "type" = "string"
                                }
                                "channel" = {
                                  "description" = "The channel or user to send notifications to."
                                  "type" = "string"
                                }
                                "color" = {
                                  "type" = "string"
                                }
                                "fallback" = {
                                  "type" = "string"
                                }
                                "fields" = {
                                  "description" = "A list of Slack fields that are sent with each notification."
                                  "items" = {
                                    "description" = "SlackField configures a single Slack field that is sent with each notification. Each field must contain a title, value, and optionally, a boolean value to indicate if the field is short enough to be displayed next to other fields designated as short. See https://api.slack.com/docs/message-attachments#fields for more information."
                                    "properties" = {
                                      "short" = {
                                        "type" = "boolean"
                                      }
                                      "title" = {
                                        "minLength" = 1
                                        "type" = "string"
                                      }
                                      "value" = {
                                        "minLength" = 1
                                        "type" = "string"
                                      }
                                    }
                                    "required" = [
                                      "title",
                                      "value",
                                    ]
                                    "type" = "object"
                                  }
                                  "type" = "array"
                                }
                                "footer" = {
                                  "type" = "string"
                                }
                                "httpConfig" = {
                                  "description" = "HTTP client configuration."
                                  "properties" = {
                                    "basicAuth" = {
                                      "description" = "BasicAuth for the client."
                                      "properties" = {
                                        "password" = {
                                          "description" = "The secret in the service monitor namespace that contains the password for authentication."
                                          "properties" = {
                                            "key" = {
                                              "description" = "The key of the secret to select from.  Must be a valid secret key."
                                              "type" = "string"
                                            }
                                            "name" = {
                                              "description" = "Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names TODO: Add other useful fields. apiVersion, kind, uid?"
                                              "type" = "string"
                                            }
                                            "optional" = {
                                              "description" = "Specify whether the Secret or its key must be defined"
                                              "type" = "boolean"
                                            }
                                          }
                                          "required" = [
                                            "key",
                                          ]
                                          "type" = "object"
                                        }
                                        "username" = {
                                          "description" = "The secret in the service monitor namespace that contains the username for authentication."
                                          "properties" = {
                                            "key" = {
                                              "description" = "The key of the secret to select from.  Must be a valid secret key."
                                              "type" = "string"
                                            }
                                            "name" = {
                                              "description" = "Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names TODO: Add other useful fields. apiVersion, kind, uid?"
                                              "type" = "string"
                                            }
                                            "optional" = {
                                              "description" = "Specify whether the Secret or its key must be defined"
                                              "type" = "boolean"
                                            }
                                          }
                                          "required" = [
                                            "key",
                                          ]
                                          "type" = "object"
                                        }
                                      }
                                      "type" = "object"
                                    }
                                    "bearerTokenSecret" = {
                                      "description" = "The secret's key that contains the bearer token to be used by the client for authentication. The secret needs to be in the same namespace as the AlertmanagerConfig object and accessible by the Prometheus Operator."
                                      "properties" = {
                                        "key" = {
                                          "description" = "The key of the secret to select from.  Must be a valid secret key."
                                          "type" = "string"
                                        }
                                        "name" = {
                                          "description" = "Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names TODO: Add other useful fields. apiVersion, kind, uid?"
                                          "type" = "string"
                                        }
                                        "optional" = {
                                          "description" = "Specify whether the Secret or its key must be defined"
                                          "type" = "boolean"
                                        }
                                      }
                                      "required" = [
                                        "key",
                                      ]
                                      "type" = "object"
                                    }
                                    "proxyURL" = {
                                      "description" = "Optional proxy URL."
                                      "type" = "string"
                                    }
                                    "tlsConfig" = {
                                      "description" = "TLS configuration for the client."
                                      "properties" = {
                                        "ca" = {
                                          "description" = "Struct containing the CA cert to use for the targets."
                                          "properties" = {
                                            "configMap" = {
                                              "description" = "ConfigMap containing data to use for the targets."
                                              "properties" = {
                                                "key" = {
                                                  "description" = "The key to select."
                                                  "type" = "string"
                                                }
                                                "name" = {
                                                  "description" = "Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names TODO: Add other useful fields. apiVersion, kind, uid?"
                                                  "type" = "string"
                                                }
                                                "optional" = {
                                                  "description" = "Specify whether the ConfigMap or its key must be defined"
                                                  "type" = "boolean"
                                                }
                                              }
                                              "required" = [
                                                "key",
                                              ]
                                              "type" = "object"
                                            }
                                            "secret" = {
                                              "description" = "Secret containing data to use for the targets."
                                              "properties" = {
                                                "key" = {
                                                  "description" = "The key of the secret to select from.  Must be a valid secret key."
                                                  "type" = "string"
                                                }
                                                "name" = {
                                                  "description" = "Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names TODO: Add other useful fields. apiVersion, kind, uid?"
                                                  "type" = "string"
                                                }
                                                "optional" = {
                                                  "description" = "Specify whether the Secret or its key must be defined"
                                                  "type" = "boolean"
                                                }
                                              }
                                              "required" = [
                                                "key",
                                              ]
                                              "type" = "object"
                                            }
                                          }
                                          "type" = "object"
                                        }
                                        "cert" = {
                                          "description" = "Struct containing the client cert file for the targets."
                                          "properties" = {
                                            "configMap" = {
                                              "description" = "ConfigMap containing data to use for the targets."
                                              "properties" = {
                                                "key" = {
                                                  "description" = "The key to select."
                                                  "type" = "string"
                                                }
                                                "name" = {
                                                  "description" = "Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names TODO: Add other useful fields. apiVersion, kind, uid?"
                                                  "type" = "string"
                                                }
                                                "optional" = {
                                                  "description" = "Specify whether the ConfigMap or its key must be defined"
                                                  "type" = "boolean"
                                                }
                                              }
                                              "required" = [
                                                "key",
                                              ]
                                              "type" = "object"
                                            }
                                            "secret" = {
                                              "description" = "Secret containing data to use for the targets."
                                              "properties" = {
                                                "key" = {
                                                  "description" = "The key of the secret to select from.  Must be a valid secret key."
                                                  "type" = "string"
                                                }
                                                "name" = {
                                                  "description" = "Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names TODO: Add other useful fields. apiVersion, kind, uid?"
                                                  "type" = "string"
                                                }
                                                "optional" = {
                                                  "description" = "Specify whether the Secret or its key must be defined"
                                                  "type" = "boolean"
                                                }
                                              }
                                              "required" = [
                                                "key",
                                              ]
                                              "type" = "object"
                                            }
                                          }
                                          "type" = "object"
                                        }
                                        "insecureSkipVerify" = {
                                          "description" = "Disable target certificate validation."
                                          "type" = "boolean"
                                        }
                                        "keySecret" = {
                                          "description" = "Secret containing the client key file for the targets."
                                          "properties" = {
                                            "key" = {
                                              "description" = "The key of the secret to select from.  Must be a valid secret key."
                                              "type" = "string"
                                            }
                                            "name" = {
                                              "description" = "Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names TODO: Add other useful fields. apiVersion, kind, uid?"
                                              "type" = "string"
                                            }
                                            "optional" = {
                                              "description" = "Specify whether the Secret or its key must be defined"
                                              "type" = "boolean"
                                            }
                                          }
                                          "required" = [
                                            "key",
                                          ]
                                          "type" = "object"
                                        }
                                        "serverName" = {
                                          "description" = "Used to verify the hostname for the targets."
                                          "type" = "string"
                                        }
                                      }
                                      "type" = "object"
                                    }
                                  }
                                  "type" = "object"
                                }
                                "iconEmoji" = {
                                  "type" = "string"
                                }
                                "iconURL" = {
                                  "type" = "string"
                                }
                                "imageURL" = {
                                  "type" = "string"
                                }
                                "linkNames" = {
                                  "type" = "boolean"
                                }
                                "mrkdwnIn" = {
                                  "items" = {
                                    "type" = "string"
                                  }
                                  "type" = "array"
                                }
                                "pretext" = {
                                  "type" = "string"
                                }
                                "sendResolved" = {
                                  "description" = "Whether or not to notify about resolved alerts."
                                  "type" = "boolean"
                                }
                                "shortFields" = {
                                  "type" = "boolean"
                                }
                                "text" = {
                                  "type" = "string"
                                }
                                "thumbURL" = {
                                  "type" = "string"
                                }
                                "title" = {
                                  "type" = "string"
                                }
                                "titleLink" = {
                                  "type" = "string"
                                }
                                "username" = {
                                  "type" = "string"
                                }
                              }
                              "type" = "object"
                            }
                            "type" = "array"
                          }
                          "victoropsConfigs" = {
                            "description" = "List of VictorOps configurations."
                            "items" = {
                              "description" = "VictorOpsConfig configures notifications via VictorOps. See https://prometheus.io/docs/alerting/latest/configuration/#victorops_config"
                              "properties" = {
                                "apiKey" = {
                                  "description" = "The secret's key that contains the API key to use when talking to the VictorOps API. The secret needs to be in the same namespace as the AlertmanagerConfig object and accessible by the Prometheus Operator."
                                  "properties" = {
                                    "key" = {
                                      "description" = "The key of the secret to select from.  Must be a valid secret key."
                                      "type" = "string"
                                    }
                                    "name" = {
                                      "description" = "Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names TODO: Add other useful fields. apiVersion, kind, uid?"
                                      "type" = "string"
                                    }
                                    "optional" = {
                                      "description" = "Specify whether the Secret or its key must be defined"
                                      "type" = "boolean"
                                    }
                                  }
                                  "required" = [
                                    "key",
                                  ]
                                  "type" = "object"
                                }
                                "apiUrl" = {
                                  "description" = "The VictorOps API URL."
                                  "type" = "string"
                                }
                                "customFields" = {
                                  "description" = "Additional custom fields for notification."
                                  "items" = {
                                    "description" = "KeyValue defines a (key, value) tuple."
                                    "properties" = {
                                      "key" = {
                                        "description" = "Key of the tuple."
                                        "minLength" = 1
                                        "type" = "string"
                                      }
                                      "value" = {
                                        "description" = "Value of the tuple."
                                        "type" = "string"
                                      }
                                    }
                                    "required" = [
                                      "key",
                                      "value",
                                    ]
                                    "type" = "object"
                                  }
                                  "type" = "array"
                                }
                                "entityDisplayName" = {
                                  "description" = "Contains summary of the alerted problem."
                                  "type" = "string"
                                }
                                "httpConfig" = {
                                  "description" = "The HTTP client's configuration."
                                  "properties" = {
                                    "basicAuth" = {
                                      "description" = "BasicAuth for the client."
                                      "properties" = {
                                        "password" = {
                                          "description" = "The secret in the service monitor namespace that contains the password for authentication."
                                          "properties" = {
                                            "key" = {
                                              "description" = "The key of the secret to select from.  Must be a valid secret key."
                                              "type" = "string"
                                            }
                                            "name" = {
                                              "description" = "Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names TODO: Add other useful fields. apiVersion, kind, uid?"
                                              "type" = "string"
                                            }
                                            "optional" = {
                                              "description" = "Specify whether the Secret or its key must be defined"
                                              "type" = "boolean"
                                            }
                                          }
                                          "required" = [
                                            "key",
                                          ]
                                          "type" = "object"
                                        }
                                        "username" = {
                                          "description" = "The secret in the service monitor namespace that contains the username for authentication."
                                          "properties" = {
                                            "key" = {
                                              "description" = "The key of the secret to select from.  Must be a valid secret key."
                                              "type" = "string"
                                            }
                                            "name" = {
                                              "description" = "Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names TODO: Add other useful fields. apiVersion, kind, uid?"
                                              "type" = "string"
                                            }
                                            "optional" = {
                                              "description" = "Specify whether the Secret or its key must be defined"
                                              "type" = "boolean"
                                            }
                                          }
                                          "required" = [
                                            "key",
                                          ]
                                          "type" = "object"
                                        }
                                      }
                                      "type" = "object"
                                    }
                                    "bearerTokenSecret" = {
                                      "description" = "The secret's key that contains the bearer token to be used by the client for authentication. The secret needs to be in the same namespace as the AlertmanagerConfig object and accessible by the Prometheus Operator."
                                      "properties" = {
                                        "key" = {
                                          "description" = "The key of the secret to select from.  Must be a valid secret key."
                                          "type" = "string"
                                        }
                                        "name" = {
                                          "description" = "Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names TODO: Add other useful fields. apiVersion, kind, uid?"
                                          "type" = "string"
                                        }
                                        "optional" = {
                                          "description" = "Specify whether the Secret or its key must be defined"
                                          "type" = "boolean"
                                        }
                                      }
                                      "required" = [
                                        "key",
                                      ]
                                      "type" = "object"
                                    }
                                    "proxyURL" = {
                                      "description" = "Optional proxy URL."
                                      "type" = "string"
                                    }
                                    "tlsConfig" = {
                                      "description" = "TLS configuration for the client."
                                      "properties" = {
                                        "ca" = {
                                          "description" = "Struct containing the CA cert to use for the targets."
                                          "properties" = {
                                            "configMap" = {
                                              "description" = "ConfigMap containing data to use for the targets."
                                              "properties" = {
                                                "key" = {
                                                  "description" = "The key to select."
                                                  "type" = "string"
                                                }
                                                "name" = {
                                                  "description" = "Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names TODO: Add other useful fields. apiVersion, kind, uid?"
                                                  "type" = "string"
                                                }
                                                "optional" = {
                                                  "description" = "Specify whether the ConfigMap or its key must be defined"
                                                  "type" = "boolean"
                                                }
                                              }
                                              "required" = [
                                                "key",
                                              ]
                                              "type" = "object"
                                            }
                                            "secret" = {
                                              "description" = "Secret containing data to use for the targets."
                                              "properties" = {
                                                "key" = {
                                                  "description" = "The key of the secret to select from.  Must be a valid secret key."
                                                  "type" = "string"
                                                }
                                                "name" = {
                                                  "description" = "Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names TODO: Add other useful fields. apiVersion, kind, uid?"
                                                  "type" = "string"
                                                }
                                                "optional" = {
                                                  "description" = "Specify whether the Secret or its key must be defined"
                                                  "type" = "boolean"
                                                }
                                              }
                                              "required" = [
                                                "key",
                                              ]
                                              "type" = "object"
                                            }
                                          }
                                          "type" = "object"
                                        }
                                        "cert" = {
                                          "description" = "Struct containing the client cert file for the targets."
                                          "properties" = {
                                            "configMap" = {
                                              "description" = "ConfigMap containing data to use for the targets."
                                              "properties" = {
                                                "key" = {
                                                  "description" = "The key to select."
                                                  "type" = "string"
                                                }
                                                "name" = {
                                                  "description" = "Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names TODO: Add other useful fields. apiVersion, kind, uid?"
                                                  "type" = "string"
                                                }
                                                "optional" = {
                                                  "description" = "Specify whether the ConfigMap or its key must be defined"
                                                  "type" = "boolean"
                                                }
                                              }
                                              "required" = [
                                                "key",
                                              ]
                                              "type" = "object"
                                            }
                                            "secret" = {
                                              "description" = "Secret containing data to use for the targets."
                                              "properties" = {
                                                "key" = {
                                                  "description" = "The key of the secret to select from.  Must be a valid secret key."
                                                  "type" = "string"
                                                }
                                                "name" = {
                                                  "description" = "Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names TODO: Add other useful fields. apiVersion, kind, uid?"
                                                  "type" = "string"
                                                }
                                                "optional" = {
                                                  "description" = "Specify whether the Secret or its key must be defined"
                                                  "type" = "boolean"
                                                }
                                              }
                                              "required" = [
                                                "key",
                                              ]
                                              "type" = "object"
                                            }
                                          }
                                          "type" = "object"
                                        }
                                        "insecureSkipVerify" = {
                                          "description" = "Disable target certificate validation."
                                          "type" = "boolean"
                                        }
                                        "keySecret" = {
                                          "description" = "Secret containing the client key file for the targets."
                                          "properties" = {
                                            "key" = {
                                              "description" = "The key of the secret to select from.  Must be a valid secret key."
                                              "type" = "string"
                                            }
                                            "name" = {
                                              "description" = "Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names TODO: Add other useful fields. apiVersion, kind, uid?"
                                              "type" = "string"
                                            }
                                            "optional" = {
                                              "description" = "Specify whether the Secret or its key must be defined"
                                              "type" = "boolean"
                                            }
                                          }
                                          "required" = [
                                            "key",
                                          ]
                                          "type" = "object"
                                        }
                                        "serverName" = {
                                          "description" = "Used to verify the hostname for the targets."
                                          "type" = "string"
                                        }
                                      }
                                      "type" = "object"
                                    }
                                  }
                                  "type" = "object"
                                }
                                "messageType" = {
                                  "description" = "Describes the behavior of the alert (CRITICAL, WARNING, INFO)."
                                  "type" = "string"
                                }
                                "monitoringTool" = {
                                  "description" = "The monitoring tool the state message is from."
                                  "type" = "string"
                                }
                                "routingKey" = {
                                  "description" = "A key used to map the alert to a team."
                                  "type" = "string"
                                }
                                "sendResolved" = {
                                  "description" = "Whether or not to notify about resolved alerts."
                                  "type" = "boolean"
                                }
                                "stateMessage" = {
                                  "description" = "Contains long explanation of the alerted problem."
                                  "type" = "string"
                                }
                              }
                              "type" = "object"
                            }
                            "type" = "array"
                          }
                          "webhookConfigs" = {
                            "description" = "List of webhook configurations."
                            "items" = {
                              "description" = "WebhookConfig configures notifications via a generic receiver supporting the webhook payload. See https://prometheus.io/docs/alerting/latest/configuration/#webhook_config"
                              "properties" = {
                                "httpConfig" = {
                                  "description" = "HTTP client configuration."
                                  "properties" = {
                                    "basicAuth" = {
                                      "description" = "BasicAuth for the client."
                                      "properties" = {
                                        "password" = {
                                          "description" = "The secret in the service monitor namespace that contains the password for authentication."
                                          "properties" = {
                                            "key" = {
                                              "description" = "The key of the secret to select from.  Must be a valid secret key."
                                              "type" = "string"
                                            }
                                            "name" = {
                                              "description" = "Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names TODO: Add other useful fields. apiVersion, kind, uid?"
                                              "type" = "string"
                                            }
                                            "optional" = {
                                              "description" = "Specify whether the Secret or its key must be defined"
                                              "type" = "boolean"
                                            }
                                          }
                                          "required" = [
                                            "key",
                                          ]
                                          "type" = "object"
                                        }
                                        "username" = {
                                          "description" = "The secret in the service monitor namespace that contains the username for authentication."
                                          "properties" = {
                                            "key" = {
                                              "description" = "The key of the secret to select from.  Must be a valid secret key."
                                              "type" = "string"
                                            }
                                            "name" = {
                                              "description" = "Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names TODO: Add other useful fields. apiVersion, kind, uid?"
                                              "type" = "string"
                                            }
                                            "optional" = {
                                              "description" = "Specify whether the Secret or its key must be defined"
                                              "type" = "boolean"
                                            }
                                          }
                                          "required" = [
                                            "key",
                                          ]
                                          "type" = "object"
                                        }
                                      }
                                      "type" = "object"
                                    }
                                    "bearerTokenSecret" = {
                                      "description" = "The secret's key that contains the bearer token to be used by the client for authentication. The secret needs to be in the same namespace as the AlertmanagerConfig object and accessible by the Prometheus Operator."
                                      "properties" = {
                                        "key" = {
                                          "description" = "The key of the secret to select from.  Must be a valid secret key."
                                          "type" = "string"
                                        }
                                        "name" = {
                                          "description" = "Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names TODO: Add other useful fields. apiVersion, kind, uid?"
                                          "type" = "string"
                                        }
                                        "optional" = {
                                          "description" = "Specify whether the Secret or its key must be defined"
                                          "type" = "boolean"
                                        }
                                      }
                                      "required" = [
                                        "key",
                                      ]
                                      "type" = "object"
                                    }
                                    "proxyURL" = {
                                      "description" = "Optional proxy URL."
                                      "type" = "string"
                                    }
                                    "tlsConfig" = {
                                      "description" = "TLS configuration for the client."
                                      "properties" = {
                                        "ca" = {
                                          "description" = "Struct containing the CA cert to use for the targets."
                                          "properties" = {
                                            "configMap" = {
                                              "description" = "ConfigMap containing data to use for the targets."
                                              "properties" = {
                                                "key" = {
                                                  "description" = "The key to select."
                                                  "type" = "string"
                                                }
                                                "name" = {
                                                  "description" = "Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names TODO: Add other useful fields. apiVersion, kind, uid?"
                                                  "type" = "string"
                                                }
                                                "optional" = {
                                                  "description" = "Specify whether the ConfigMap or its key must be defined"
                                                  "type" = "boolean"
                                                }
                                              }
                                              "required" = [
                                                "key",
                                              ]
                                              "type" = "object"
                                            }
                                            "secret" = {
                                              "description" = "Secret containing data to use for the targets."
                                              "properties" = {
                                                "key" = {
                                                  "description" = "The key of the secret to select from.  Must be a valid secret key."
                                                  "type" = "string"
                                                }
                                                "name" = {
                                                  "description" = "Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names TODO: Add other useful fields. apiVersion, kind, uid?"
                                                  "type" = "string"
                                                }
                                                "optional" = {
                                                  "description" = "Specify whether the Secret or its key must be defined"
                                                  "type" = "boolean"
                                                }
                                              }
                                              "required" = [
                                                "key",
                                              ]
                                              "type" = "object"
                                            }
                                          }
                                          "type" = "object"
                                        }
                                        "cert" = {
                                          "description" = "Struct containing the client cert file for the targets."
                                          "properties" = {
                                            "configMap" = {
                                              "description" = "ConfigMap containing data to use for the targets."
                                              "properties" = {
                                                "key" = {
                                                  "description" = "The key to select."
                                                  "type" = "string"
                                                }
                                                "name" = {
                                                  "description" = "Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names TODO: Add other useful fields. apiVersion, kind, uid?"
                                                  "type" = "string"
                                                }
                                                "optional" = {
                                                  "description" = "Specify whether the ConfigMap or its key must be defined"
                                                  "type" = "boolean"
                                                }
                                              }
                                              "required" = [
                                                "key",
                                              ]
                                              "type" = "object"
                                            }
                                            "secret" = {
                                              "description" = "Secret containing data to use for the targets."
                                              "properties" = {
                                                "key" = {
                                                  "description" = "The key of the secret to select from.  Must be a valid secret key."
                                                  "type" = "string"
                                                }
                                                "name" = {
                                                  "description" = "Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names TODO: Add other useful fields. apiVersion, kind, uid?"
                                                  "type" = "string"
                                                }
                                                "optional" = {
                                                  "description" = "Specify whether the Secret or its key must be defined"
                                                  "type" = "boolean"
                                                }
                                              }
                                              "required" = [
                                                "key",
                                              ]
                                              "type" = "object"
                                            }
                                          }
                                          "type" = "object"
                                        }
                                        "insecureSkipVerify" = {
                                          "description" = "Disable target certificate validation."
                                          "type" = "boolean"
                                        }
                                        "keySecret" = {
                                          "description" = "Secret containing the client key file for the targets."
                                          "properties" = {
                                            "key" = {
                                              "description" = "The key of the secret to select from.  Must be a valid secret key."
                                              "type" = "string"
                                            }
                                            "name" = {
                                              "description" = "Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names TODO: Add other useful fields. apiVersion, kind, uid?"
                                              "type" = "string"
                                            }
                                            "optional" = {
                                              "description" = "Specify whether the Secret or its key must be defined"
                                              "type" = "boolean"
                                            }
                                          }
                                          "required" = [
                                            "key",
                                          ]
                                          "type" = "object"
                                        }
                                        "serverName" = {
                                          "description" = "Used to verify the hostname for the targets."
                                          "type" = "string"
                                        }
                                      }
                                      "type" = "object"
                                    }
                                  }
                                  "type" = "object"
                                }
                                "maxAlerts" = {
                                  "description" = "Maximum number of alerts to be sent per webhook message. When 0, all alerts are included."
                                  "format" = "int32"
                                  "minimum" = 0
                                  "type" = "integer"
                                }
                                "sendResolved" = {
                                  "description" = "Whether or not to notify about resolved alerts."
                                  "type" = "boolean"
                                }
                                "url" = {
                                  "description" = "The URL to send HTTP POST requests to. `urlSecret` takes precedence over `url`. One of `urlSecret` and `url` should be defined."
                                  "type" = "string"
                                }
                                "urlSecret" = {
                                  "description" = "The secret's key that contains the webhook URL to send HTTP requests to. `urlSecret` takes precedence over `url`. One of `urlSecret` and `url` should be defined. The secret needs to be in the same namespace as the AlertmanagerConfig object and accessible by the Prometheus Operator."
                                  "properties" = {
                                    "key" = {
                                      "description" = "The key of the secret to select from.  Must be a valid secret key."
                                      "type" = "string"
                                    }
                                    "name" = {
                                      "description" = "Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names TODO: Add other useful fields. apiVersion, kind, uid?"
                                      "type" = "string"
                                    }
                                    "optional" = {
                                      "description" = "Specify whether the Secret or its key must be defined"
                                      "type" = "boolean"
                                    }
                                  }
                                  "required" = [
                                    "key",
                                  ]
                                  "type" = "object"
                                }
                              }
                              "type" = "object"
                            }
                            "type" = "array"
                          }
                          "wechatConfigs" = {
                            "description" = "List of WeChat configurations."
                            "items" = {
                              "description" = "WeChatConfig configures notifications via WeChat. See https://prometheus.io/docs/alerting/latest/configuration/#wechat_config"
                              "properties" = {
                                "agentID" = {
                                  "type" = "string"
                                }
                                "apiSecret" = {
                                  "description" = "The secret's key that contains the WeChat API key. The secret needs to be in the same namespace as the AlertmanagerConfig object and accessible by the Prometheus Operator."
                                  "properties" = {
                                    "key" = {
                                      "description" = "The key of the secret to select from.  Must be a valid secret key."
                                      "type" = "string"
                                    }
                                    "name" = {
                                      "description" = "Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names TODO: Add other useful fields. apiVersion, kind, uid?"
                                      "type" = "string"
                                    }
                                    "optional" = {
                                      "description" = "Specify whether the Secret or its key must be defined"
                                      "type" = "boolean"
                                    }
                                  }
                                  "required" = [
                                    "key",
                                  ]
                                  "type" = "object"
                                }
                                "apiURL" = {
                                  "description" = "The WeChat API URL."
                                  "type" = "string"
                                }
                                "corpID" = {
                                  "description" = "The corp id for authentication."
                                  "type" = "string"
                                }
                                "httpConfig" = {
                                  "description" = "HTTP client configuration."
                                  "properties" = {
                                    "basicAuth" = {
                                      "description" = "BasicAuth for the client."
                                      "properties" = {
                                        "password" = {
                                          "description" = "The secret in the service monitor namespace that contains the password for authentication."
                                          "properties" = {
                                            "key" = {
                                              "description" = "The key of the secret to select from.  Must be a valid secret key."
                                              "type" = "string"
                                            }
                                            "name" = {
                                              "description" = "Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names TODO: Add other useful fields. apiVersion, kind, uid?"
                                              "type" = "string"
                                            }
                                            "optional" = {
                                              "description" = "Specify whether the Secret or its key must be defined"
                                              "type" = "boolean"
                                            }
                                          }
                                          "required" = [
                                            "key",
                                          ]
                                          "type" = "object"
                                        }
                                        "username" = {
                                          "description" = "The secret in the service monitor namespace that contains the username for authentication."
                                          "properties" = {
                                            "key" = {
                                              "description" = "The key of the secret to select from.  Must be a valid secret key."
                                              "type" = "string"
                                            }
                                            "name" = {
                                              "description" = "Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names TODO: Add other useful fields. apiVersion, kind, uid?"
                                              "type" = "string"
                                            }
                                            "optional" = {
                                              "description" = "Specify whether the Secret or its key must be defined"
                                              "type" = "boolean"
                                            }
                                          }
                                          "required" = [
                                            "key",
                                          ]
                                          "type" = "object"
                                        }
                                      }
                                      "type" = "object"
                                    }
                                    "bearerTokenSecret" = {
                                      "description" = "The secret's key that contains the bearer token to be used by the client for authentication. The secret needs to be in the same namespace as the AlertmanagerConfig object and accessible by the Prometheus Operator."
                                      "properties" = {
                                        "key" = {
                                          "description" = "The key of the secret to select from.  Must be a valid secret key."
                                          "type" = "string"
                                        }
                                        "name" = {
                                          "description" = "Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names TODO: Add other useful fields. apiVersion, kind, uid?"
                                          "type" = "string"
                                        }
                                        "optional" = {
                                          "description" = "Specify whether the Secret or its key must be defined"
                                          "type" = "boolean"
                                        }
                                      }
                                      "required" = [
                                        "key",
                                      ]
                                      "type" = "object"
                                    }
                                    "proxyURL" = {
                                      "description" = "Optional proxy URL."
                                      "type" = "string"
                                    }
                                    "tlsConfig" = {
                                      "description" = "TLS configuration for the client."
                                      "properties" = {
                                        "ca" = {
                                          "description" = "Struct containing the CA cert to use for the targets."
                                          "properties" = {
                                            "configMap" = {
                                              "description" = "ConfigMap containing data to use for the targets."
                                              "properties" = {
                                                "key" = {
                                                  "description" = "The key to select."
                                                  "type" = "string"
                                                }
                                                "name" = {
                                                  "description" = "Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names TODO: Add other useful fields. apiVersion, kind, uid?"
                                                  "type" = "string"
                                                }
                                                "optional" = {
                                                  "description" = "Specify whether the ConfigMap or its key must be defined"
                                                  "type" = "boolean"
                                                }
                                              }
                                              "required" = [
                                                "key",
                                              ]
                                              "type" = "object"
                                            }
                                            "secret" = {
                                              "description" = "Secret containing data to use for the targets."
                                              "properties" = {
                                                "key" = {
                                                  "description" = "The key of the secret to select from.  Must be a valid secret key."
                                                  "type" = "string"
                                                }
                                                "name" = {
                                                  "description" = "Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names TODO: Add other useful fields. apiVersion, kind, uid?"
                                                  "type" = "string"
                                                }
                                                "optional" = {
                                                  "description" = "Specify whether the Secret or its key must be defined"
                                                  "type" = "boolean"
                                                }
                                              }
                                              "required" = [
                                                "key",
                                              ]
                                              "type" = "object"
                                            }
                                          }
                                          "type" = "object"
                                        }
                                        "cert" = {
                                          "description" = "Struct containing the client cert file for the targets."
                                          "properties" = {
                                            "configMap" = {
                                              "description" = "ConfigMap containing data to use for the targets."
                                              "properties" = {
                                                "key" = {
                                                  "description" = "The key to select."
                                                  "type" = "string"
                                                }
                                                "name" = {
                                                  "description" = "Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names TODO: Add other useful fields. apiVersion, kind, uid?"
                                                  "type" = "string"
                                                }
                                                "optional" = {
                                                  "description" = "Specify whether the ConfigMap or its key must be defined"
                                                  "type" = "boolean"
                                                }
                                              }
                                              "required" = [
                                                "key",
                                              ]
                                              "type" = "object"
                                            }
                                            "secret" = {
                                              "description" = "Secret containing data to use for the targets."
                                              "properties" = {
                                                "key" = {
                                                  "description" = "The key of the secret to select from.  Must be a valid secret key."
                                                  "type" = "string"
                                                }
                                                "name" = {
                                                  "description" = "Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names TODO: Add other useful fields. apiVersion, kind, uid?"
                                                  "type" = "string"
                                                }
                                                "optional" = {
                                                  "description" = "Specify whether the Secret or its key must be defined"
                                                  "type" = "boolean"
                                                }
                                              }
                                              "required" = [
                                                "key",
                                              ]
                                              "type" = "object"
                                            }
                                          }
                                          "type" = "object"
                                        }
                                        "insecureSkipVerify" = {
                                          "description" = "Disable target certificate validation."
                                          "type" = "boolean"
                                        }
                                        "keySecret" = {
                                          "description" = "Secret containing the client key file for the targets."
                                          "properties" = {
                                            "key" = {
                                              "description" = "The key of the secret to select from.  Must be a valid secret key."
                                              "type" = "string"
                                            }
                                            "name" = {
                                              "description" = "Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names TODO: Add other useful fields. apiVersion, kind, uid?"
                                              "type" = "string"
                                            }
                                            "optional" = {
                                              "description" = "Specify whether the Secret or its key must be defined"
                                              "type" = "boolean"
                                            }
                                          }
                                          "required" = [
                                            "key",
                                          ]
                                          "type" = "object"
                                        }
                                        "serverName" = {
                                          "description" = "Used to verify the hostname for the targets."
                                          "type" = "string"
                                        }
                                      }
                                      "type" = "object"
                                    }
                                  }
                                  "type" = "object"
                                }
                                "message" = {
                                  "description" = "API request data as defined by the WeChat API."
                                  "type" = "string"
                                }
                                "messageType" = {
                                  "type" = "string"
                                }
                                "sendResolved" = {
                                  "description" = "Whether or not to notify about resolved alerts."
                                  "type" = "boolean"
                                }
                                "toParty" = {
                                  "type" = "string"
                                }
                                "toTag" = {
                                  "type" = "string"
                                }
                                "toUser" = {
                                  "type" = "string"
                                }
                              }
                              "type" = "object"
                            }
                            "type" = "array"
                          }
                        }
                        "required" = [
                          "name",
                        ]
                        "type" = "object"
                      }
                      "type" = "array"
                    }
                    "route" = {
                      "description" = "The Alertmanager route definition for alerts matching the resource’s namespace. If present, it will be added to the generated Alertmanager configuration as a first-level route."
                      "properties" = {
                        "continue" = {
                          "description" = "Boolean indicating whether an alert should continue matching subsequent sibling nodes. It will always be overridden to true for the first-level route by the Prometheus operator."
                          "type" = "boolean"
                        }
                        "groupBy" = {
                          "description" = "List of labels to group by."
                          "items" = {
                            "type" = "string"
                          }
                          "type" = "array"
                        }
                        "groupInterval" = {
                          "description" = "How long to wait before sending an updated notification. Must match the regular expression `[0-9]+(ms|s|m|h)` (milliseconds seconds minutes hours)."
                          "type" = "string"
                        }
                        "groupWait" = {
                          "description" = "How long to wait before sending the initial notification. Must match the regular expression `[0-9]+(ms|s|m|h)` (milliseconds seconds minutes hours)."
                          "type" = "string"
                        }
                        "matchers" = {
                          "description" = "List of matchers that the alert’s labels should match. For the first level route, the operator removes any existing equality and regexp matcher on the `namespace` label and adds a `namespace: <object namespace>` matcher."
                          "items" = {
                            "description" = "Matcher defines how to match on alert's labels."
                            "properties" = {
                              "name" = {
                                "description" = "Label to match."
                                "minLength" = 1
                                "type" = "string"
                              }
                              "regex" = {
                                "description" = "Whether to match on equality (false) or regular-expression (true)."
                                "type" = "boolean"
                              }
                              "value" = {
                                "description" = "Label value to match."
                                "type" = "string"
                              }
                            }
                            "required" = [
                              "name",
                            ]
                            "type" = "object"
                          }
                          "type" = "array"
                        }
                        "receiver" = {
                          "description" = "Name of the receiver for this route. If not empty, it should be listed in the `receivers` field."
                          "type" = "string"
                        }
                        "repeatInterval" = {
                          "description" = "How long to wait before repeating the last notification. Must match the regular expression `[0-9]+(ms|s|m|h)` (milliseconds seconds minutes hours)."
                          "type" = "string"
                        }
                        "routes" = {
                          "description" = "Child routes."
                          "items" = {
                            "x-kubernetes-preserve-unknown-fields" = true
                          }
                          "type" = "array"
                        }
                      }
                      "type" = "object"
                    }
                  }
                  "type" = "object"
                }
              }
              "required" = [
                "spec",
              ]
              "type" = "object"
            }
          }
          "served" = true
          "storage" = true
        },
      ]
    }
  }
}
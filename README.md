This module installs the prometheus operator and associated CRDs into your Kubernetes cluster. It is an HCL translation of https://raw.githubusercontent.com/prometheus-operator/prometheus-operator/master/bundle.yaml.

This module uses an as-yet unreleased version (0.3.0) of the kubernetes-alpha provider.

Currently the module installs all resources into the default namespace. Note that on GKE, some resources in this module require cluster administrator permissions to install.

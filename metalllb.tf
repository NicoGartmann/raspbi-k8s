resource "helm_release" "metallb" {
  name             = "metallb"
  repository       = "https://metallb.github.io/metallb"
  chart            = "metallb"
  version          = "0.14.8"
  namespace        = "metallb"
  create_namespace = true

  values = [
    templatefile("${path.module}/templates/metallb.yml.tftpl", {})
  ]
}

resource "kubernetes_manifest" "metalllb-config" {
  manifest = {
    "apiVersion" = "v1"
    "kind"       = "ConfigMap"
    "metadata" = {
      "namespace" = "metallb"
      "name"      = "metallb-config"
    }
    "data" = {
      "config" = <<EOF
address-pools:
  - name: default
    protocol: layer2
    addresses:
      - 192.168.3.11-192.168.3.11
EOF
    }
  }
}


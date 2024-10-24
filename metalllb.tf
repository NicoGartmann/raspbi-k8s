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

resource "kubernetes_manifest" "ip_address_pool" {
  manifest = {
    "apiVersion" = "metallb.io/v1beta1"
    "kind" = "IPAddressPool"
    "metadata" = {
      "name" = "example"
      "namespace" = "metallb"
    }
    "spec" = {
      "addresses" = [
        "192.168.3.100/32",
      ]
    }
  }
}

resource "kubernetes_manifest" "l2_advertisement" {
  manifest = {
    "apiVersion" = "metallb.io/v1beta1"
    "kind" = "L2Advertisement"
    "metadata" = {
      "name" = "empty"
      "namespace" = "metallb"
    }
  }
}

#resource "kubernetes_manifest" "metalllb-config" {
#  manifest = {
#    "apiVersion" = "v1"
#    "kind"       = "ConfigMap"
#    "metadata" = {
#      "namespace" = "metallb"
#      "name"      = "metallb-config"
#    }
#    "data" = {
#      "config" = <<EOF
#address-pools:
#  - name: default
#    protocol: layer2
#    addresses:
#      - 192.168.3.100-192.168.3.100
#EOF
#    }
#  }
#}


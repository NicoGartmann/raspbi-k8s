resource "helm_release" "nextcloud" {
  name = "nextcloud"
  repository = "https://nextcloud.github.io/helm"
  chart = "nextcloud"
  version = "5.2.2"
  namespace = "nextcloud"
  create_namespace = true
}


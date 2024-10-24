resource "helm_release" "pihole" {
  name = "pihole"
  repository = "https://mojo2600.github.io/pihole-kubernetes"
  chart = "pihole"
  version = "2.26.1"
  namespace = "pihole"
  create_namespace = true

  values = [
    templatefile("${path.module}/templates/pihole.yml.tftpl",{})
  ]
}


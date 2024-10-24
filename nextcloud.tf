locals {
  nextcloud_data_pvc = "nextcloud-data-pvc"
}

resource "kubernetes_persistent_volume" "nextcloud_data" {
  metadata {
    name = "nextcloud-data"
  }

  spec {
    capacity = {
      storage = "20Gi"
    }
    access_modes = ["ReadWriteMany"]

    persistent_volume_source {
      host_path {
        path = "/mnt/usb/nextcloud"
        type = "DirectoryOrCreate"
      }
    }
  }
}

resource "kubernetes_persistent_volume_claim" "nextcloud_data" {
  metadata {
    name = local.nextcloud_data_pvc
  }

  spec {
    access_modes = ["ReadWriteMany"]
    resources {
      requests = {
        storage = "20Gi"
      }
    }
    volume_name = "$(kubernetes_persistent_volume.nextcloud_data.metadata[0].name)"
  }
}

resource "helm_release" "nextcloud" {
  name             = "nextcloud"
  repository       = "https://nextcloud.github.io/helm"
  chart            = "nextcloud"
  version          = "5.5.4"
  namespace        = "nextcloud"
  create_namespace = true

  values = [
    templatefile("${path.module}/templates/nextcloud.yml.tftpl", {
      nextcloud_data_pvc = local.nextcloud_data_pvc
    })
  ]

  depends_on = [
    kubernetes_persistent_volume.nextcloud_data
  ]
}


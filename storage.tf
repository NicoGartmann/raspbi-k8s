resource "kubernetes_manifest" "drive-hostpath" {
  manifest = {
    apiVersion = "storage.k8s.io/v1"
    kind = "StorageClass"
    metadata = {
      name = "drive-hostpath"
    }
    provisioner = "microk8s.io/hostpath"
    reclaimPolicy = "Delete"
    parameters = {
      pvDir = "/mnt/data"
    }
    volumeBindingMode = "WaitForFirstConsumer"
  }
}


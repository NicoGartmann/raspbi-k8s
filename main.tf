terraform {
  backend "remote" {
    organization = "ElGartmanno"

    workspaces {
      name = "raspi-k8s"
    }
  }
}


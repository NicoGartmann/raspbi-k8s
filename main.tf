terraform {
  backend "remote" {
    organization = "ElGartmanno"

    workspaces {
      name = "raspbi-k8s"
    }
  }
}


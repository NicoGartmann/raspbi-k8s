#resource "helm_release" "kubernetes-dashboard" {
#  name             = "kubernetes-dashboard"
#  repository       = ""
#  chart            = ""
#  version          = ""
#  namespace        = "kubernetes-dashboard"
#  create_namespace = true
#}
#
#resource "helm_release" "cert-manager" {
#  name             = "cert-manager"
#  repository       = "https://charts.jetstack.io"
#  chart            = "cert-manager"
#  version          = "v1.15.1"
#  namespace        = "cert-manager"
#  create_namespace = true
#}
#
#resource "helm_release" "nextcloud" {
#  name             = "nextcloud"
#  repository       = "https://nextcloud.github.io/helm"
#  chart            = "nextcloud"
#  version          = "5.2.2"
#  namespace        = "nextcloud"
#  create_namespace = true
#}
#
#resource "helm_release" "nginx_ingress" {
#  name             = "ingress-nginx"
#  chart            = "ingress-nginx"
#  repository       = "https://kubernetes.github.io/ingress-nginx"
#  version          = "v1.11.1"
#  namespace        = "ingress-nginx"
#  create_namespace = true
#}
#

resource "helm_release" "kube-prom-stack" {
  name = "kube-prom-stack"
  repository = "https://prometheus-community.github.io/helm-charts"
  chart = "kube-prometheus-stack"
  version = "45.5.0"
  namespace = "observability"
  create_namespace = true

  values = [
    templatefile("${path.module}/templates/kube-prom-stack.yml.tftpl",{})
  ]
  
  depends_on = [
    helm_release.loki,
    helm_release.tempo
  ]  
}

resource "helm_release" "loki" {
  name = "loki"
  repository = "https://grafana.github.io/helm-charts"
  chart = "loki-stack"
  version = "2.9.9"
  namespace = "observability"
  create_namespace = true

  values = [
    templatefile("${path.module}/templates/loki.yml.tftpl", {})
  ]
}

resource "helm_release" "tempo" {
  name = "tempo"
  repository = "https://grafana.github.io/helm-charts"
  chart = "tempo"
  version = "1.0.0"
  namespace = "observability"
  create_namespace = true
}


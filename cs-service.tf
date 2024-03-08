resource "kubernetes_service" "nginx" {
  metadata {
    name      = "nginx-service"
    namespace = local.common.casestudy.namespace
  }

  spec {
    selector = {
      app = kubernetes_deployment.nginx.metadata[0].labels["app"]
    }

    port {
      port        = 80
      target_port = 80
    }

    type = "LoadBalancer"
  }
}
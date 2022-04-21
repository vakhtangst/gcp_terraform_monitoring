resource "google_cloud_run_service" "default" {
  name     = "cloudrun-srv"
  location = "us-central1"

  template {
    spec {
      containers {
        image = "us-docker.pkg.dev/cloudrun/container/hello"
      }
    }

    metadata {
      annotations = {
        "autoscaling.knative.dev/minScale" = "3"
        "autoscaling.knative.dev/maxScale" = "5"
        "run.googleapis.com/client-name"   = "terraform"
      }
    }
  }
  autogenerate_revision_name = true
}
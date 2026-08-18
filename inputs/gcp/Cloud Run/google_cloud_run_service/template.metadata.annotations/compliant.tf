# Compliant — template.metadata.annotations satisfying every merged scenario
resource "google_cloud_run_service" "compliant_example_1" {
  name     = "compliant_example_1"
  location = "australia-southeast1"
  project  = "my-gcp-project"

  metadata {
    namespace = "my-gcp-project"
  }

  template {
    metadata {
      annotations = {
        "run.googleapis.com/ingress" = "internal"
        "autoscaling.knative.dev/maxScale" = "10"
        "run.googleapis.com/binary-authorization" = "default"
        "run.googleapis.com/cloudsql-instances" = "my-gcp-project:australia-southeast1:prod-db"
        "run.googleapis.com/encryption-key" = "projects/my-gcp-project/locations/australia-southeast1/keyRings/prod-keyring/cryptoKeys/cloudrun-key"
        "run.googleapis.com/vpc-access-connector" = "projects/my-gcp-project/locations/australia-southeast1/connectors/prod-vpc-connector"
        "run.googleapis.com/vpc-access-egress" = "private-ranges-only"
      }
    }

    spec {
      containers {
        image = "us-docker.pkg.dev/cloudrun/container/hello"
      }
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }
}

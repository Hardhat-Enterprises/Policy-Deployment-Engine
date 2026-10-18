# Non-compliant — one per scenario, each violating a single annotation
# nc1: scenario 1 — ingress is public
resource "google_cloud_run_service" "non_compliant_example_1" {
  name     = "non_compliant_example_1"
  location = "australia-southeast1"
  project  = "my-gcp-project"

  metadata {
    namespace = "my-gcp-project"
    annotations = {
      "run.googleapis.com/ingress" = "all"
      "run.googleapis.com/binary-authorization-breakglass" = ""
      "run.googleapis.com/custom-audiences" = "trusted-client"
    }
  }

  template {
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
# nc2: scenario 2 — binary-authorization breakglass enabled
resource "google_cloud_run_service" "non_compliant_example_2" {
  name     = "non_compliant_example_2"
  location = "australia-southeast1"
  project  = "my-gcp-project"

  metadata {
    namespace = "my-gcp-project"
    annotations = {
      "run.googleapis.com/ingress" = "internal"
      "run.googleapis.com/binary-authorization-breakglass" = "emergency-bypass"
      "run.googleapis.com/custom-audiences" = "trusted-client"
    }
  }

  template {
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
# nc3: scenario 3 — custom-audiences uses wildcard
resource "google_cloud_run_service" "non_compliant_example_3" {
  name     = "non_compliant_example_3"
  location = "australia-southeast1"
  project  = "my-gcp-project"

  metadata {
    namespace = "my-gcp-project"
    annotations = {
      "run.googleapis.com/ingress" = "internal"
      "run.googleapis.com/binary-authorization-breakglass" = ""
      "run.googleapis.com/custom-audiences" = "*"
    }
  }

  template {
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

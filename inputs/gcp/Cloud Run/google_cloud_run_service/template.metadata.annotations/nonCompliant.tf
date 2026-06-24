# Non-compliant — one per scenario, each violating a single annotation
# nc1: scenario 1 — template ingress is public
resource "google_cloud_run_service" "non_compliant_example_1" {
  name     = "non_compliant_example_1"
  location = "australia-southeast1"
  project  = "my-gcp-project"

  metadata {
    namespace = "my-gcp-project"
  }

  template {
    metadata {
      annotations = {
        "run.googleapis.com/ingress" = "all"
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
# nc2: scenario 2 — maxScale out of approved range
resource "google_cloud_run_service" "non_compliant_example_2" {
  name     = "non_compliant_example_2"
  location = "australia-southeast1"
  project  = "my-gcp-project"

  metadata {
    namespace = "my-gcp-project"
  }

  template {
    metadata {
      annotations = {
        "run.googleapis.com/ingress" = "internal"
        "autoscaling.knative.dev/maxScale" = "1000"
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
# nc3: scenario 3 — binary-authorization not default
resource "google_cloud_run_service" "non_compliant_example_3" {
  name     = "non_compliant_example_3"
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
        "run.googleapis.com/binary-authorization" = "disabled"
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
# nc4: scenario 4 — unapproved Cloud SQL instance
resource "google_cloud_run_service" "non_compliant_example_4" {
  name     = "non_compliant_example_4"
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
        "run.googleapis.com/cloudsql-instances" = "unknown-project:us-central1:test-db"
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
# nc5: scenario 5 — unapproved encryption key
resource "google_cloud_run_service" "non_compliant_example_5" {
  name     = "non_compliant_example_5"
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
        "run.googleapis.com/encryption-key" = "projects/random-project/locations/us-central1/keyRings/test/cryptoKeys/test-key"
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
# nc6: scenario 6 — unapproved VPC access connector
resource "google_cloud_run_service" "non_compliant_example_6" {
  name     = "non_compliant_example_6"
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
        "run.googleapis.com/vpc-access-connector" = "projects/random-project/locations/us-central1/connectors/test-connector"
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
# nc7: scenario 7 — unapproved VPC egress
resource "google_cloud_run_service" "non_compliant_example_7" {
  name     = "non_compliant_example_7"
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
        "run.googleapis.com/vpc-access-egress" = "all-traffic"
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

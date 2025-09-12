# Describe your resource type here
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant


resource "google_project" "project_nc" {
  project_id      = "tf-test-noncompliant"
  name            = "tf-test-noncompliant"
  org_id          = "123456789"
  billing_account = "000000-0000000-0000000-000000"
  provider        = google-beta
}

resource "google_managed_kafka_cluster" "gmk_cluster_nc" {
  project    = google_project.project_nc.project_id
  cluster_id = "my-cluster"
  location   = "us-central1"

  capacity_config {
    vcpu_count   = 3
    memory_bytes = 3221225472

  }

  gcp_config {
    access_config {
      network_configs {

        subnet = "projects/${google_project.project_nc.project_id}/regions/us-central1/subnetworks/default"
      }
    }
  }

  provider = google-beta
}

resource "google_managed_kafka_connect_cluster" "nc" {
  project            = google_project.project_nc.project_id
  connect_cluster_id = "noncompliant-connect-cluster"
  kafka_cluster      = "projects/${google_project.project_nc.project_id}/locations/us-central1/clusters/${google_managed_kafka_cluster.gmk_cluster_nc.cluster_id}"
  location           = "us-central1"

  capacity_config {
    vcpu_count   = 2                       # ❌ Below min CPU
    memory_bytes = 2147483648             # ❌ Below min memory

  }

  gcp_config {
    access_config {
      network_configs {

        primary_subnet   = "projects/${google_project.project_nc.project_id}/regions/us-central1/subnetworks/default"
        dns_domain_names = ["${google_managed_kafka_cluster.gmk_cluster_nc.cluster_id}.us-central1.managedkafka.${google_project.project_nc.project_id}.cloud.goog"]  # ❌ Public DNS

      }
    }
  }

  labels = {

    environment = "testing"
  }

  provider = google-beta

}

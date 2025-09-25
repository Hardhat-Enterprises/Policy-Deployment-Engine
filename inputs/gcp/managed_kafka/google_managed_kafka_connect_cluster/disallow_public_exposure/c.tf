# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant

# Compliant Project
resource "google_project" "project" {
  project_id      = "tf-test-compliant"
  name            = "tf-test-compliant"
  org_id          = "123456789"
  billing_account = "000000-0000000-0000000-000000"
  provider        = google-beta
}

# Compliant Kafka Cluster
resource "google_managed_kafka_cluster" "gmk_cluster" {
  project    = google_project.project.project_id
  cluster_id = "compliant-kafka-cluster"
  location   = "us-central1"

  capacity_config {
    vcpu_count   = 3
    memory_bytes = 3221225472
  }

  gcp_config {
    access_config {
      network_configs {
        subnet = "projects/${google_project.project.project_id}/regions/us-central1/subnetworks/private-subnet"
      }
    }
  }

  provider = google-beta
}

# ✅ Compliant Kafka Connect Cluster (No public exposure)
resource "google_managed_kafka_connect_cluster" "c" {
  project             = google_project.project.project_id
  connect_cluster_id  = "compliant-connect-cluster"
  kafka_cluster       = "projects/${google_project.project.project_id}/locations/us-central1/clusters/${google_managed_kafka_cluster.gmk_cluster.cluster_id}"
  location            = "us-central1"

  capacity_config {
    vcpu_count   = 4
    memory_bytes = 4294967296
  }

  gcp_config {
    access_config {
      network_configs {
        primary_subnet   = "projects/${google_project.project.project_id}/regions/us-central1/subnetworks/private-subnet"
        
      }
    }
  }

  labels = {
    security = "compliant"
  }

  provider = google-beta
}

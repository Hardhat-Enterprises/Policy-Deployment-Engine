# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant

# ✅ Compliant Kafka Connect Cluster (No public exposure)
resource "google_managed_kafka_connect_cluster" "c" {
  project             = "c"
  connect_cluster_id  = "cc"
  kafka_cluster       = "projects/c/locations/us-central1/clusters/cc"
  location            = "us-central1"

  capacity_config {
    vcpu_count   = 4
    memory_bytes = 4294967296
  }

  gcp_config {
    access_config {
      network_configs {
        primary_subnet   = "projects/c/regions/us-central1/subnetworks/private-subnet-1"
        
      }
    }
  }

  labels = {
    security = "compliant"
  }

  provider = google-beta
}

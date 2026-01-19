# Describe your resource type here
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

# ❌ Non-Compliant Kafka Connect Cluster (Publicly exposed)
resource "google_managed_kafka_connect_cluster" "nc" {
  project             = "nc"
  connect_cluster_id  = "ncc"
  kafka_cluster       = "projects/nc/locations/us-central1/clusters/ncc"
  location            = "us-central1"

  capacity_config {
    vcpu_count   = 4
    memory_bytes = 4294967296
  }

  gcp_config {
    access_config {
      network_configs {
        primary_subnet   = "projects/nc/regions/us-central1/subnetworks/public-subnet-1"
        
      }
    }
  }

  labels = {
    security = "noncompliant"
  }

  provider = google-beta
}

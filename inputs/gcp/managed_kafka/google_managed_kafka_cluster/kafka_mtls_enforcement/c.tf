# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_managed_kafka_cluster" "c" {
  cluster_id = "c"
  location   = "us-central1"
  project    = "123"

  capacity_config {
    vcpu_count   = 3
    memory_bytes = 3221225472
  }

  gcp_config {
    access_config {
      network_configs {
        subnet = "projects/my-project/regions/us-central1/subnetworks/private-subnet"
      }
    }
  }

  tls_config {
    trust_config {
      cas_configs {
        ca_pool = google_privateca_ca_pool.ca_pool.id
      }
    }
  }
}

resource "google_privateca_ca_pool" "ca_pool" {
  name     = "my-ca-pool"
  location = "us-central1"
  tier     = "ENTERPRISE"
  project  = "123"
}

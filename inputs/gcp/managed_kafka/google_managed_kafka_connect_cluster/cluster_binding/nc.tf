# Describe your resource type here
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant



resource "google_managed_kafka_cluster" "gmk_cluster_nc" {
    provider = google
  
  project    = "my-project"
  cluster_id = "my-kafka-cluster"
  location   = "us-central1"

  capacity_config {
    vcpu_count    = 3
    memory_bytes  = 3221225472
  }

  gcp_config {
    access_config {
      network_configs {
        subnet = "projects/my-project/regions/us-central1/subnetworks/default"
      }
    }
  }
}


resource "google_managed_kafka_connect_cluster" "nc" {
    provider = google
  project             = "my-project"
  connect_cluster_id  = "my-connect-cluster"
  kafka_cluster       = "projects/my-project/locations/us-central1/clusters/invalid-cluster" # ❌ Wrong cluster
  location            = "us-central1"

  capacity_config {
    vcpu_count   = 4
    memory_bytes = 8589934592
  }

  gcp_config {
    access_config {
      network_configs {
        primary_subnet = "projects/my-project/regions/us-central1/subnetworks/default"
        
      }
    }
  }

  labels = {
    env = "dev"
  }
}

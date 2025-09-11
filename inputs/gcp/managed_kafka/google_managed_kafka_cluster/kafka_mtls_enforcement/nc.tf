# Describe your resource type here
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_managed_kafka_cluster" "insecure_tls_cluster" {
  cluster_id = "insecure-tls-cluster"
  location   = "us-central1"
  project = "123"

  capacity_config {
    vcpu_count    = 3
    memory_bytes  = 3221225472
  }

  gcp_config {
    access_config {
      network_configs {
        subnet = "projects/my-project/regions/us-central1/subnetworks/private-subnet"
      }
    }
  }

  
}

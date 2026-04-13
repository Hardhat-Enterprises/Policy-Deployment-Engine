resource "google_managed_kafka_cluster" "nc" {
  cluster_id = "nc"
  location   = "us-central3"
  project    = "123"

  capacity_config {
    vcpu_count   = 3
    memory_bytes = 3221225472
  }

  gcp_config {
    access_config {
      network_configs {
        subnet = "projects/my-project/regions/us-central1/subnetworks/public-subnet"
      }
    }

  }
}

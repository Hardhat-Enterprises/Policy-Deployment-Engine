resource "google_managed_kafka_connect_cluster" "nc" {
  project            = "nc"
  connect_cluster_id = "ncc"
  kafka_cluster      = "projects/nc/locations/us-central1/clusters/nc"
  location           = "us-central1"

  capacity_config {
    vcpu_count   = 1                       # ❌ Below min CPU
    memory_bytes = 1073741824             # ❌ Below min memory

  }

  gcp_config {
    access_config {
      network_configs {

        primary_subnet   = "projects/nc/regions/us-central1/subnetworks/default"
        dns_domain_names = ["nc.us-central1.managedkafka.nc.cloud.goog"]  # ❌ Public DNS

      }
    }
  }

  labels = {

    environment = "testing"
  }

  provider = google-beta

}

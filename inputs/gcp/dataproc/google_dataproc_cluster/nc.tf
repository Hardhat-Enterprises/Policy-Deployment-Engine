resource "google_dataproc_cluster" "nc" {
  project = "my-project-dataproc02"
  region  = "us-central1"
  name    = "cluster-nc-example"

  cluster_config {
    # VIOLATION: Missing encryption_config block for CMEK.
    gce_cluster_config {
      zone = "us-central1-a"
      # VIOLATION: Allows public IPs.
      internal_ip_only = false
    }
  }
}
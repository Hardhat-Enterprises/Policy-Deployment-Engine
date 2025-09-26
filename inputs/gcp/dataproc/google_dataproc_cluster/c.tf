resource "google_dataproc_cluster" "c" {
  project = "my-project-dataproc02"
  region  = "us-central1"
  name    = "c"

  cluster_config {
    # Compliant: Specifies a Customer-Managed Encryption Key.
    encryption_config {
      # This is just a placeholder string. It does not need to exist.
      kms_key_name = "projects/my-project-dataproc02/locations/us-central1/keyRings/example-keyring/cryptoKeys/example-key"
    }
    gce_cluster_config {
      zone = "us-central1-a"
      # Compliant: Ensures the cluster is private.
      internal_ip_only = true
    }
  }
}
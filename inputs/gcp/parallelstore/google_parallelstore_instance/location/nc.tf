@"
resource "google_parallelstore_instance" "nc" {
  name         = "bad-instance"
  location     = "us-central1"
  capacity_gib = 1200

  labels = {
    owner = "student"
    env   = "dev"
  }
}
"@ | Out-File -Encoding utf8 "inputs\gcp\parallelstore\google_parallelstore_instance\location\nc.tf"

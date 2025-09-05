resource "google_parallelstore_instance" "nc" {
  instance_id        = "nc"
  location     = "us-central1"
  capacity_gib = 1200

  labels = {
    owner = "student"
    env   = "dev"
  }
}

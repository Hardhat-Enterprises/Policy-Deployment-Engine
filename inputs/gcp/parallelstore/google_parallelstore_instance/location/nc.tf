resource "google_parallelstore_instance" "bad" {
  name         = "bad-instance"
  location     = "us-central1"   # not allowed
  capacity_gib = 1200

  labels = {
    owner = "student"
    env   = "dev"
  }
}

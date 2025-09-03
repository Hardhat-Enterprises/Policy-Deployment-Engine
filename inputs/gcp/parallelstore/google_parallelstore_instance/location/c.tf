resource "google_parallelstore_instance" "c" {
  instance_id       = "good-instance"
  location     = "australia-southeast1"
  capacity_gib = 1200

  labels = {
    owner = "student"
    env   = "dev"
  }
}
resource "google_parallelstore_instance" "c" {
  name         = "good-instance"
  location     = "australia-southeast1"
  capacity_gib = 1200

  labels = {
    owner = "student"
    env   = "dev"
  }
}


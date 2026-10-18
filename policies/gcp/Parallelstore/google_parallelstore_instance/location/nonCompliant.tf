resource "google_parallelstore_instance" "non_compliant_example_1" {
  instance_id        = "non_compliant_example_1"
  location     = "us-central1"
  capacity_gib = 1200

  labels = {
    owner = "student"
    env   = "dev"
  }
}

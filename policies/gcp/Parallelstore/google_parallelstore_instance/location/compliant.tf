resource "google_parallelstore_instance" "compliant_example_1" {
  instance_id       = "compliant_example_1"
  location     = "australia-southeast1"
  capacity_gib = 1200

  labels = {
    owner = "student"
    env   = "dev"
  }
}

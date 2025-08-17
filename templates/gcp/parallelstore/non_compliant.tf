resource "google_parallelstore_instance" "bad_example" {
  name       = "bad-instance"
  location   = "us-central1"
  capacity_gib = 1200
  # missing project_id label
}

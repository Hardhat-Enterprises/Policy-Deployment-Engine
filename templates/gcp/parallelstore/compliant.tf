resource "google_parallelstore_instance" "good_example" {
  name       = "good-instance"
  location   = "australia-southeast1"
  capacity_gib = 1200

  labels = {
    project_id = "student-project"
  }
}

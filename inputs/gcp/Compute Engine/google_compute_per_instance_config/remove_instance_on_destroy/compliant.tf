resource "google_compute_per_instance_config" "compliant_example_1" {
  name                       = "compliant-example-1"
  instance_group_manager     = "my-instance-group-manager"
  zone                       = "us-central1-a"
  remove_instance_on_destroy = false
}

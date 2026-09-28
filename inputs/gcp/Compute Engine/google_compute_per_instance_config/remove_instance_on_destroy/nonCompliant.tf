resource "google_compute_per_instance_config" "non_compliant_example_1" {
  name                       = "non-compliant-example-1"
  instance_group_manager     = "my-instance-group-manager"
  zone                       = "us-central1-a"
  remove_instance_on_destroy = true
}

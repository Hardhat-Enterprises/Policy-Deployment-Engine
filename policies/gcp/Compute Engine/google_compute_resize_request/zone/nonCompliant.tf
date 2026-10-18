resource "google_compute_resize_request" "non_compliant_example_1" {
  name                   = "non-compliant-resize-request"
  instance_group_manager = "example-instance-group-manager"
  resize_by              = 2
  zone                   = "us-central1-a"
}

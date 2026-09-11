resource "google_compute_resize_request" "compliant_example_1" {
  name                   = "compliant-resize-request"
  instance_group_manager = "example-instance-group-manager"
  resize_by              = 2
  zone                   = "australia-southeast1-a"
  deletion_policy        = "DELETE"
}

resource "google_compute_per_instance_config" "non_compliant_example_1" {
  name                   = "non-compliant-example-1"
  instance_group_manager = "my-instance-group-manager"
  zone                   = "us-central1-a"

  preserved_state {
    disk {
      device_name = "data-disk-0"
      source      = "projects/my-project/zones/us-central1-a/disks/data-disk-0"
      delete_rule = "ON_PERMANENT_INSTANCE_DELETION"
    }
  }
}

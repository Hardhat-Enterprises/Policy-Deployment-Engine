resource "google_compute_region_per_instance_config" "non_compliant_example_1" {
  region = google_compute_region_instance_group_manager.igm.region
  region_instance_group_manager = google_compute_region_instance_group_manager.rigm.name
  name = "non_compliant_example_1"
  project = "pde"
  deletion_policy = "DELETE"
  preserved_state {
    metadata = {
      foo = "bar"
      instance_template = "google_compute_instance_template.igm-basic.self_link"
    }

    disk {
      device_name = "my-stateful-disk"
      source      = "google_compute_disk.default.id"
      mode        = "READ_ONLY"
    }

  }
}
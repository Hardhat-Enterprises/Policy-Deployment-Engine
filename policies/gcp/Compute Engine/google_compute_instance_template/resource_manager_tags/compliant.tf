resource "google_compute_instance_template" "compliant_example_1" {
  name         = "compliant-template"
  machine_type = "e2-medium"

  resource_manager_tags = {
    "tagKeys/281474976710656" = "tagValues/281474976710657"
  }

  disk {
    source_image = "projects/fake-project/global/images/hardened-debian-11"
    auto_delete  = true
    boot         = true
  }

  network_interface {
    network = "default"
  }
}

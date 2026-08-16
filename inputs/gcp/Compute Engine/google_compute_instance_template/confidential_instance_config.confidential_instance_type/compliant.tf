resource "google_compute_instance_template" "compliant_example_1" {
  name             = "compliant-template"
  machine_type     = "n2d-standard-2"
  min_cpu_platform = "AMD Milan"

  disk {
    source_image = "ubuntu-os-cloud/ubuntu-2204-lts"
    auto_delete   = true
    boot          = true
  }

  network_interface {
    network = "default"
  }

  scheduling {
    on_host_maintenance = "TERMINATE"
  }

  confidential_instance_config {
    enable_confidential_compute = true
    confidential_instance_type  = "SEV"
  }
}
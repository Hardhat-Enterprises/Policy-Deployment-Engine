resource "google_compute_instance_template" "compliant_example_1" {
  name         = "compliant-template"
  machine_type = "n2d-standard-2"

  disk {
    source_image      = "projects/fake-project/global/images/hardened-debian-11"
    auto_delete       = true
    boot              = true
    guest_os_features = ["UEFI_COMPATIBLE", "SEV_CAPABLE"]
  }

  disk {
    disk_size_gb      = 50
    auto_delete       = true
    boot              = false
    guest_os_features = ["UEFI_COMPATIBLE", "SEV_CAPABLE", "GVNIC"]
  }

  network_interface {
    network = "default"
  }
}

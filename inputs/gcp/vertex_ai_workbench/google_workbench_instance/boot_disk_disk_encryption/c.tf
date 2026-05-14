resource "google_workbench_instance" "c1" {
  project  = "my-secure-project"
  name     = "c1"
  location = "australia-southeast2-a"
  gce_setup {
    boot_disk {
      disk_encryption = "CMEK"
      kms_key         = "projects/my-secure-project/locations/australia-southeast2/keyRings/my-ring/cryptoKeys/my-key"
    }
  }
}

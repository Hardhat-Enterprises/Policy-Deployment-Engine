resource "google_workbench_instance" "c" {
  project  = "my-secure-project"
  name     = "c"
  location = "australia-southeast2-a"
  gce_setup {
    data_disks {
      kms_key = "projects/my-secure-project/locations/australia-southeast2/keyRings/my-ring/cryptoKeys/my-key"
    }
  }
}

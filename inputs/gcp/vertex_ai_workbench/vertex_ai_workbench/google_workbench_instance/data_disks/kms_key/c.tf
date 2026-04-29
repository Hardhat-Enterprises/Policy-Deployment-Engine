resource "google_workbench_instance" "c1" {
  project  = "my-secure-project"
  name     = "workbench-instance"
  location = "australia-southeast2-a"
  gce_setup {
    data_disks {
      kms_key = "projects/my-secure-project/locations/australia-southeast2/keyRings/my-ring/cryptoKeys/my-key"
    }
  }
}

resource "google_workbench_instance" "compliant_example_1" {
  project  = "my-secure-project"
  name     = "compliant_example_1"
  location = "australia-southeast2-a"
  gce_setup {
    data_disks {
      kms_key = "projects/my-secure-project/locations/australia-southeast2/keyRings/my-ring/cryptoKeys/my-key"
    }
  }
}

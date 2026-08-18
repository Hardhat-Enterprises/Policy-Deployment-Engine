resource "google_workbench_instance" "compliant_example_1" {
  project                     = "my-secure-project"
  name                        = "compliant_example_1"
  location                    = "australia-southeast2-a"
  enable_third_party_identity = "false"
}

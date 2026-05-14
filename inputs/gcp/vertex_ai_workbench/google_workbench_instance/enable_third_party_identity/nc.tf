resource "google_workbench_instance" "nc1" {
  project                     = "my-secure-project"
  name                        = "nc1"
  location                    = "australia-southeast2-a"
  enable_third_party_identity = "true"
}

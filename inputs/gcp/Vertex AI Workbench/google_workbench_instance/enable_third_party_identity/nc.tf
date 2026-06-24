resource "google_workbench_instance" "nc" {
  project                     = "my-secure-project"
  name                        = "nc"
  location                    = "australia-southeast2-a"
  enable_third_party_identity = "true"
}

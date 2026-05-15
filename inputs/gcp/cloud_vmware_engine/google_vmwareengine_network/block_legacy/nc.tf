resource "google_vmwareengine_network" "nc" {
  project     = "project-d7f19645-ccba-48ef-bce"
  name        = "nc"
  location    = "us-west1"
  type        = "LEGACY"
  description = "nc"
}


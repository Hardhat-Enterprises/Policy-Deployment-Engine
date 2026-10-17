resource "google_vmwareengine_network" "non_compliant_example_1" {
  project     = "vmw-proj"
  name        = "non_compliant_example_1" 
  location    = "us-west1"
  type        = "LEGACY"
  description = "VMwareEngine legacy network sample"
}


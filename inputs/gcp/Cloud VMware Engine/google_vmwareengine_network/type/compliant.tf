resource "google_vmwareengine_network" "compliant_example_1" {
  project     = "vmw-proj"
  name        = "compliant_example_1" 
  location    = "australia-southeast2"
  type        = "STANDARD"
  description = "VMwareEngine legacy network sample"
}


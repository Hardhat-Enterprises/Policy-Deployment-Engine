resource "google_certificate_manager_certificate_map_entry" "compliant_example_1" {
  project     = "sit764-policy-project"
  name        = "compliant_example_1"
  description = "Compliant certificate map entry with approved environment label."
  map         = "c-map"

  certificates = [
    "projects/sit764-policy-project/locations/global/certificates/c-certificate"
  ]

  hostname = "secure.example.com"

  labels = {
    environment = "production"
  }
}

resource "google_certificate_manager_certificate_map_entry" "non_compliant_example_1" {
  project     = "sit764-policy-project"
  name        = "non_compliant_example_1"
  description = "Non-compliant certificate map entry with non-approved environment label."
  map         = "nc-map"

  certificates = [
    "projects/sit764-policy-project/locations/global/certificates/nc-certificate"
  ]

  hostname = "unapproved.example.net"

  labels = {
    environment = "development"
  }
}

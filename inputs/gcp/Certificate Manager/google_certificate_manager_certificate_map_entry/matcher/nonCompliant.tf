resource "google_certificate_manager_certificate_map_entry" "non_compliant_example_1" {
  name         = "non_compliant_example_1"
  project      = "sit764-policy-project"
  description  = "Non-compliant certificate map entry using a non-approved matcher value."
  map          = "nc-map"
  certificates = ["projects/sit764-policy-project/locations/global/certificates/nc-certificate"]
  matcher      = "DEFAULT"
}

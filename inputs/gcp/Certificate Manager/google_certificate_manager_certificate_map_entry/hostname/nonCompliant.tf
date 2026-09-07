resource "google_certificate_manager_certificate_map_entry" "non_compliant_example_1" {
  name         = "non_compliant_example_1"
  project      = "sit764-policy-project"
  description  = "Compliant certificate map entry using an approved hostname."
  map          = "c-map"
  certificates = ["projects/sit764-policy-project/locations/global/certificates/c-certificate"]
  hostname     = "unapproved.example.net"
}

resource "google_netapp_kmsconfig" "compliant_example_1" {
  project  = "deakin-lab-123"
  name = "compliant_example_1"
  description="this is a test description"
  crypto_key_name="projects/deakin-lab-123/locations/australia-southeast2/keyRings/netapp-kr/cryptoKeys/netapp-cmek"
  location="australia-southeast2"
}

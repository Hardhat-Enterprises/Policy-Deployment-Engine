resource "google_netapp_kmsconfig" "non_compliant_example_1" {
  name = "non_compliant_example_1"
  project  = "deakin-lab-123"
  description="this is a test description"
  crypto_key_name="projects/deakin-lab-123/locations/australia-southeast2/keyRings/netapp-kr/cryptoKeys/netapp-cmek"
  location="us-west1"
}

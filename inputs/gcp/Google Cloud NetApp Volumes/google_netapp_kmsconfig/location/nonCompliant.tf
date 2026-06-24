resource "google_netapp_kmsconfig" "non_compliant_example_1" {
  name = "non_compliant_example_1"
  project  = "deakin-lab-123"
  description="this is a test description"
  crypto_key_name="projects/deakin-lab-123/locations/global/keyRings/kr/cryptoKeys/k"
  location="us-west1"
}

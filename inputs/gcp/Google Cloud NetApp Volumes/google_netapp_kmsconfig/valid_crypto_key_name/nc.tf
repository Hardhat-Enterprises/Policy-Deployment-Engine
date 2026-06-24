resource "google_netapp_kmsconfig" "nc1" {
  project  = "deakin-lab-123"
  name = "nc1"
  description="this is a test description"
  crypto_key_name="projects/deakin-lab-123/locations/global/keyRings/kr/cryptoKeys/k"
  location=""
}
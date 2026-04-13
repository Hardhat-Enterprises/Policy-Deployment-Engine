
resource "google_beyondcorp_app_gateway" "nc" {
  name         = "nc"
  project      = "smooth-verve-467716-v1"
<<<<<<< HEAD
  type         = "TCP_PROXY"
=======
  type         = "TYPE_UNSPECIFIED"
>>>>>>> origin/dev
  host_type    = "GCP_REGIONAL_MIG"
  region       = "us-central1"
}

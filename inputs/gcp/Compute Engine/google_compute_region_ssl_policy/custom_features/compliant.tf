resource "google_compute_region_ssl_policy" "compliant_example_1" {
  name    = "compliant-example-1"
  region  = "australia-southeast1"
  profile = "CUSTOM"

  custom_features = [
    "TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256"
  ]
}

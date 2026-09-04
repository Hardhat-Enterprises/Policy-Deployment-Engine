resource "google_compute_region_ssl_policy" "non_compliant_example_1" {
  name    = "non-compliant-example-1"
  region  = "australia-southeast1"
  profile = "CUSTOM"

  custom_features = [
    "TLS_RSA_WITH_3DES_EDE_CBC_SHA"
  ]
}

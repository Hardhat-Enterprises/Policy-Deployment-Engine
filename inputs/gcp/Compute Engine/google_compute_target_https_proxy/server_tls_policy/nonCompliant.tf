resource "google_compute_target_https_proxy" "non_compliant_example_1" {
  name               = "noncompliant-https-proxy-1"
  url_map            = "fake-url-map-1"
  server_tls_policy  = "projects/unapproved-project/locations/global/serverTlsPolicies/unapproved-policy"
}

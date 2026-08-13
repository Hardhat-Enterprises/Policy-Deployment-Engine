resource "google_compute_target_https_proxy" "non_compliant_example_1" {
  name    = "noncompliant-https-proxy-1"
  url_map = "fake-url-map-1"
  certificate_manager_certificates = [
    "//certificatemanager.googleapis.com/projects/unapproved-project/locations/global/certificates/unapproved-cert"
  ]
}

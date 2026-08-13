resource "google_compute_target_https_proxy" "compliant_example_1" {
  name             = "compliant-https-proxy-1"
  url_map          = "fake-url-map-1"
  certificate_map  = "//certificatemanager.googleapis.com/projects/approved-project/locations/global/certificateMaps/approved-map"
}

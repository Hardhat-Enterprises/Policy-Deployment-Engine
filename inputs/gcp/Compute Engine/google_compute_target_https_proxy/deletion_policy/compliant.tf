# Compute Target HTTPS Proxy — deletion_policy under test.
# Only the tested resource type appears here; url_map points at a fake
# value instead of creating a real dependency resource.
resource "google_compute_target_https_proxy" "compliant_example_1" {
  name             = "compliant-https-proxy-1"
  url_map          = "fake-url-map-1"
  deletion_policy  = "PREVENT"
}

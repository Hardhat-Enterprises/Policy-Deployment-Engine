resource "google_compute_region_target_https_proxy" "non_compliant_example_1" {
  name             = "non-compliant-example-1"
  region           = "australia-southeast1"
  url_map          = "projects/my-project/regions/australia-southeast1/urlMaps/my-url-map"
  deletion_policy  = "DELETE"
  ssl_certificates = ["projects/my-project/regions/australia-southeast1/sslCertificates/my-cert"]
}
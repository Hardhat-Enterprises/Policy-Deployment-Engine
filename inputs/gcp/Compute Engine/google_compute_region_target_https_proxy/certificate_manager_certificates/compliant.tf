resource "google_compute_region_target_https_proxy" "compliant_example_1" {
  name                             = "compliant-example-1"
  region                           = "australia-southeast1"
  url_map                          = "projects/my-project/regions/australia-southeast1/urlMaps/my-url-map"
  certificate_manager_certificates = ["projects/my-project/locations/australia-southeast1/certificates/approved-cert"]
}
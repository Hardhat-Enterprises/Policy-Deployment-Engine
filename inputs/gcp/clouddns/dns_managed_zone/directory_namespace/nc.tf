resource "google_service_directory_namespace" "nc" {
    provider = "google-beta"
    project = "dns_managed_zone"
    namespace_id = "pde-example1"
    location = "australia_southeast2"
}


resource "google_service_directory_namespace" "c" {
    provider = "google-beta"
    project = "dns_managed_zone"
    namespace_id = "pde-example"
    location = "australia_southeast2"
}

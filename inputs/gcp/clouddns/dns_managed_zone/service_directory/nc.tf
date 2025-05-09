resource "google_dns_managed_zone" "nc" {
    provider = "google-beta"
    name = "peering-zone"
    project = "dns_managed_services"
    dns_name = "pde.example1.com"
    description = "private dns service directory zone example"

    visibility = "public"
    
    service_directory_config {
        namespace {
            namespace_url = "google_service_directory_namespace.pde.com"
        }
    }
}
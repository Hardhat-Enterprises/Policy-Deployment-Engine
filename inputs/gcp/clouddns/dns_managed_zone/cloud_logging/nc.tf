resource "google_dns_managed_zone" "nc" {
    name = "cloud-logging-enabled-zone"
    project = "dns_managed_services"
    dns_name = "pde.example1.com"
    description = "enable cloud logging enabled DNS zone"
    cloud_logging_config {
      enable_logging = false
    }
}
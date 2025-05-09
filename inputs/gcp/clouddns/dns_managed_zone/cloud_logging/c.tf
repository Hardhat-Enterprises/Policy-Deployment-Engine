resource "google_dns_managed_zone" "c" {
    name = "cloud-logging-enabled-zone"
    project = "dns_managed_services"
    dns_name = "pde.example1.com"
    description = "enable cloud logging enabled DNS zone"
    cloud_logging_config {
      enable_logging = true
    }
}

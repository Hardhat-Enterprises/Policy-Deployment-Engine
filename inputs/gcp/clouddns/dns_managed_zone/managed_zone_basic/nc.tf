

resource "google_dns_managed_zone" "nc" {
    name = "example"
    project = "dns_managed_zone"
    dns_name = "PDE.example.com"
}


resource "google_dns_managed_zone" "c" {
    name = "example"
    project = "dns_managed_zone"
    dns_name = "PDE.example.com"
}

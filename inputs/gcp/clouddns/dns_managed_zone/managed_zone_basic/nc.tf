# Describe your resource type here
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_dns_managed_zone" "nc" {
    name = "example"
    project = "dns_managed_zone"
    dns_name = "PDE.example.com"
}
# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_privateca_ca_pool" "c" {
    name = "c"
    project = "PDE-project"
    location = "us-central1"
    tier = "ENTERPRISE"
    publishing_options {
        publish_ca_cert = true
        publish_crl = true
    }
    issuance_policy {
      # 90 days
      maximum_lifetime = "7776000s"
    }
}

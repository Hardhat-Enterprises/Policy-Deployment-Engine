# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_privateca_ca_pool" "c" {
    name = "test-pool"
    project = "PDE-project"
    location = "us-central1"
    tier = "ENTERPRISE"
    publishing_options {
        # This can be changed as needed
        publish_ca_cert = true
        # This can be changed when needed
        publish_crl = true
    }
}

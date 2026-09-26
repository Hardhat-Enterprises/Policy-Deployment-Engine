resource "google_identity_platform_config" "compliant_example_1" {
  project = "fake-project"
  multi_tenant {
    allow_tenants = false
  }
}

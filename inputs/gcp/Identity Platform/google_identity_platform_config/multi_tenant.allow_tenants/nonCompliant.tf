resource "google_identity_platform_config" "non_compliant_example_1" {
  project = "fake-project"
  multi_tenant {
    allow_tenants = true
  }
}

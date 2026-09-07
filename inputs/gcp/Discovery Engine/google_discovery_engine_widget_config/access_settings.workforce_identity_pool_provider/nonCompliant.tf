resource "google_discovery_engine_widget_config" "non_compliant_example_1" {
    engine_id  = "non_compliant_example_1"
    location   = "eu"
    project    = "capstone project"
    access_settings {
        workforce_identity_pool_provider = "locations/asia/workforcePools/approved-pool/providers/approved-provider"
    }
}

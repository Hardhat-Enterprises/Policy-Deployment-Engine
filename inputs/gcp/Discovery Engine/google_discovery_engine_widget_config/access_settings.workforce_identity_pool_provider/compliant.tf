resource "google_discovery_engine_widget_config" "compliant_example_1" {
    engine_id  = "compliant_example_1"
    location   = "eu"
    project    = "capstone project"
    access_settings {
        workforce_identity_pool_provider = "locations/global/workforcePools/example-pool/providers/example-provider"
    }
}

resource "google_discovery_engine_widget_config" "non_compliant_example_1" {
    engine_id  = "non_compliant_example_1"
    location   = "eu"
    project    = "capstone project"
    access_settings {
        allow_public_access = true
    }
}

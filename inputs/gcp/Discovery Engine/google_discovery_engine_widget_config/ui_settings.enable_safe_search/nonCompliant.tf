resource "google_discovery_engine_widget_config" "non_compliant_example_1" {
    engine_id  = "non_compliant_example_1"
    location   = "eu"
    project    = "capstone project"
    ui_settings {
        enable_safe_search = false
    }
}

resource "google_discovery_engine_widget_config" "compliant_example_1" {
    engine_id  = "compliant_example_1"
    location   = "eu"
    project    = "capstone project"
    ui_settings {
        disable_user_events_collection = true
    }
}

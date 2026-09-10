resource "google_discovery_engine_data_store" "compliant_example_1" {
    project               = "735927692082"
    location              = "eu"
    data_store_id         = "compliant_example_1"
    display_name          = "compliant_example_1"
    industry_vertical     = "GENERIC"
    content_config        = "NO_CONTENT"
    solution_types        = ["SOLUTION_TYPE_SEARCH"]
    create_advanced_site_search = false
    kms_key_name          = "projects/my-project/locations/eu/keyRings/my-ring/cryptoKeys/my-key"
}

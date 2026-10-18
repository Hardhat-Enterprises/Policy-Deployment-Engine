resource "google_ces_example" "compliant_example_1" {
    location     = "australia-southeast1"
    display_name = "example-name"
    app          = "example-app"
    example_id   = "example-id"
    deletion_policy  = "PREVENT"
}



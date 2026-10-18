resource "google_compute_instance_group" "non_compliant_example_1" {
    name            = "non-compliant-example-1"
    zone          = "australia-southeast1-a"
    deletion_policy = "DELETE"
}

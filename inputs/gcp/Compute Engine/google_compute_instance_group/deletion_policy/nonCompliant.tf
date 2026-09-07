resource "google_compute_instance_group" "non_compliant_example_1" {
    name            = "compliant-example-1"
    zone          = "australia-southeast1"
    deletion_policy = "DELETE"
}

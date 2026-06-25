resource "google_workbench_instance" "compliant_example_1" {
  project         = "my-secure-project"
  name            = "compliant_example_1"
  location        = "australia-southeast2-a"
  instance_owners = ["user@example.com"]
}

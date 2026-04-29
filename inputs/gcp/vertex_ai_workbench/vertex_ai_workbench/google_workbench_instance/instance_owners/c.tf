resource "google_workbench_instance" "c1" {
  project         = "my-secure-project"
  name            = "workbench-instance"
  location        = "australia-southeast2-a"
  instance_owners = ["user@example.com"]
}

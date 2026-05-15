resource "google_workbench_instance" "c" {
  project  = "my-secure-project"
  name     = "c"
  location = "australia-southeast2-a"
  labels = {
    environment = "dev"
    team        = "data-science"
  }
}

resource "google_workbench_instance" "nc" {
  project              = "my-secure-project"
  name                 = "nc"
  location             = "australia-southeast2-a"
  disable_proxy_access = "true"
}

resource "google_vpc_access_connector" "compliant_example_1" {
  name           = "compliant_example_1"
  project        = "PDE"
  region         = "australia-southeast1"
  machine_type   = "e2-micro"
  min_instances  = 2
  max_instances  = 5

  subnet {
    name       = "approved-subnet"
    project_id = "fluent-coder-468700-h4"
  }
}

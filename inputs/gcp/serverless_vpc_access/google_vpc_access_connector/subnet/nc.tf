resource "google_vpc_access_connector" "nc" {
  name           = "nc"
  project        = "fluent-coder-468700-h4"
  region         = "australia-southeast1"
  machine_type   = "e2-micro"
  min_instances  = 2
  max_instances  = 5

  subnet {
    name       = "unapproved-subnet"
    project_id = "fluent-coder-468700-h4"
  }
}
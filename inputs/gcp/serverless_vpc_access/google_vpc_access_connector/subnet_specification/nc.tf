resource "google_vpc_access_connector" "nc" {
  name   = "nc"
  region = "australia-southeast1"
  subnet {
    name = "projects/fluent-coder-468700-h4/regions/australia-southeast1/subnetworks/dev-subnet"
  }
}
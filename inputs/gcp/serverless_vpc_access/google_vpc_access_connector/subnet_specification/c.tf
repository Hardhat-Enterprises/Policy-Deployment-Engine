resource "google_vpc_access_connector" "c" {
  name   = "c"
  region = "australia-southeast1"
  subnet {
    name = "projects/fluent-coder-468700-h4/regions/australia-southeast1/subnetworks/prod-subnet"
  }
}
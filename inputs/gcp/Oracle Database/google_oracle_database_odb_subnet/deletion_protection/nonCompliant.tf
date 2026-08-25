resource "google_oracle_database_odb_subnet" "non_compliant_example_1" {
  odb_subnet_id = "non-compliant-example-1"
  location      = "australia-southeast1"
  project       = "my-project"
  odbnetwork    = "my-odbnetwork"
  cidr_range    = "10.1.1.0/24"
  purpose       = "CLIENT_SUBNET"

  deletion_protection = false
}
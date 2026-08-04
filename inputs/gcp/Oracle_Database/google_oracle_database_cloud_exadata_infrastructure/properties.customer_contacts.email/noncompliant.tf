resource "google_oracle_database_cloud_exadata_infrastructure" "non_compliant_example_1" {
  properties {
    customer_contacts {
      email = "invalid-email"
    }
  }
}

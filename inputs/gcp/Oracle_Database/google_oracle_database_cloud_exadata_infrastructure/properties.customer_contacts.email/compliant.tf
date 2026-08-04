resource "google_oracle_database_cloud_exadata_infrastructure" "compliant_argument" {
  properties {
    customer_contacts {
      email = "alerts@company.com"
    }
  }
}

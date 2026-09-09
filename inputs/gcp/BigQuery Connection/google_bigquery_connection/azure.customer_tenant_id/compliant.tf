resource "google_bigquery_connection" "compliant_example_1" {
  connection_id = "compliant_example_1"
  location      = "azure-eastus2"
  azure {
    customer_tenant_id = "approved-tenant-id"
  }
}

resource "google_bigquery_connection" "non_compliant_example_1" {
  connection_id = "non_compliant_example_1"
  location      = "azure-eastus2"
  azure {
    customer_tenant_id = "untrusted-tenant-id"
  }
}

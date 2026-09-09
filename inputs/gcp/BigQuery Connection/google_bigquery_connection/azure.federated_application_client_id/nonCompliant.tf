resource "google_bigquery_connection" "non_compliant_example_1" {
  connection_id = "non_compliant_example_1"
  location      = "azure-eastus2"
  azure {
    customer_tenant_id               = "customer-tenant-id"
    federated_application_client_id  = "untrusted-9999-0000-0000-a480155501ce"
  }
}

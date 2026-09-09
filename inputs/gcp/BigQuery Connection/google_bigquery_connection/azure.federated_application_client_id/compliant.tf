resource "google_bigquery_connection" "compliant_example_1" {
  connection_id = "compliant_example_1"
  location      = "azure-eastus2"
  azure {
    customer_tenant_id               = "customer-tenant-id"
    federated_application_client_id  = "b43e0000-0000-0000-0000-a480155501ce"
  }
}

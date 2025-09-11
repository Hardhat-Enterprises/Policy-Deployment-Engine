resource "google_bigquery_connection" "c" {
  connection_id = "azure-conn-compliant"
  location      = "australia-southeast2"
  project       = "my-project-c"

  azure {
    customer_tenant_id               = "11111111-1111-1111-1111-111111111111"
    federated_application_client_id  = "22222222-2222-2222-2222-222222222222"
  }
}

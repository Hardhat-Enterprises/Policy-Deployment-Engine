# nc.tf (non-compliant)
resource "google_bigquery_connection" "nc" {
  connection_id = "azure-conn-noncompliant"
  location      = "australia-southeast2"
  project       = "my-project-nc"

  azure {
    customer_tenant_id              = "33333333-3333-3333-3333-333333333333"
    federated_application_client_id = "22222222-2222-2222-2222-222222222222"
  }
}

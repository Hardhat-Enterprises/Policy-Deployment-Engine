resource "google_bigquery_connection" "nc" {
  connection_id = "azure-conn-noncompliant"
  location      = "australia-southeast2"
  project       = "my-project-nc"

  azure {
    customer_tenant_id               = "11111111-1111-1111-1111-111111111111"
    federated_application_client_id  = "33333333-3333-3333-3333-333333333333"
  }
}

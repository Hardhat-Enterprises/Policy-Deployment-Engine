resource "google_bigquery_connection" "c" {
  project       = "my-project c"
  location      = "australia-southeast1"
  connection_id = "azure-conn-c"

  azure {
    
    customer_tenant_id               = "11111111-1111-1111-1111-111111111111" # approved
    federated_application_client_id  = "22222222-2222-2222-2222-222222222222" # approved
  }
}

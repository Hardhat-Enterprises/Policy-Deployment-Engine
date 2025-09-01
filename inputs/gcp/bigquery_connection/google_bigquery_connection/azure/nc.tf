resource "google_bigquery_connection" "nc" {
  project       = "my-project nc"
  location      = "australia-southeast1"
  connection_id = "azure-conn-nc"

  azure {
    
    customer_tenant_id               = "aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa" # NOT in whitelist
    federated_application_client_id  = "bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb" # NOT in whitelist
  }
}

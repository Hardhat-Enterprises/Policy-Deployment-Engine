resource "google_oracle_database_exascale_db_storage_vault" "non_compliant_example_1" {
  exascale_db_storage_vault_id = "non-compliant-storage-vault-1"
  display_name                 = "test-exascale-vault"
  location                     = "us-central1"

  properties {
    exascale_db_storage_details {
      total_size_gbs = 1024
    }
  }
}

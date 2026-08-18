resource "google_oracle_database_exascale_db_storage_vault" "non_compliant_example_1" {
  exascale_db_storage_vault_id = "non-compliant-storage-vault-1"
  display_name                 = "Non Compliant Storage Vault 1"
  location                     = "australia-southeast1"
  deletion_protection          = false

  properties {
    exascale_db_storage_details {
      total_size_gbs = 1024
    }
  }
}

resource "google_oracle_database_exascale_db_storage_vault" "compliant_example_1" {
  exascale_db_storage_vault_id = "compliant-storage-vault-1"
  display_name                 = "Compliant Storage Vault 1"
  location                     = "australia-southeast1"
  gcp_oracle_zone               = "australia-southeast1-a-r1"

  properties {
    exascale_db_storage_details {
      total_size_gbs = 1024
    }
  }
}

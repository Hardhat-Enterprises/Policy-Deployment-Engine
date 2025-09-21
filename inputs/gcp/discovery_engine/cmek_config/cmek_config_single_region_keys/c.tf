#CMEK CONFIG Region C

resource "google_discovery_engine_cmek_config" "c" {
  location       = "eu" # multi-region scope
  cmek_config_id = "c"

  # Default CMEK for multi-regional "eu"
  kms_key        = "projects/735927692082/locations/eu/keyRings/my-ring/cryptoKeys/my-eu-key"

  project        = "735927692082"
  set_default    = true

  # Single-region CMEKs
  single_region_keys {
    kms_key = "projects/735927692082/locations/europe-west1/keyRings/my-ring/cryptoKeys/my-eu1-key"
  }
}

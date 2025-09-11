
#CMEK CONFIG Region NC

resource "google_discovery_engine_cmek_config" "nc" {
  location       = "us" # multi-region scope
  cmek_config_id = "nc"

  # Default CMEK for multi-regional "eu"
  kms_key        = "projects/735927692082/locations/eu/keyRings/my-ring/cryptoKeys/my-us-key"

  project        = "735927692082"
  set_default    = true

  # Single-region CMEKs
  single_region_keys {
    kms_key = "projects/735927692082/locations/europe-west1/keyRings/my-ring/cryptoKeys/my-us1-key"
  }
}


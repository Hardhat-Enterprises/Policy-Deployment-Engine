#CMEK CONFIG Region NC

resource "google_discovery_engine_cmek_config" "non_compliant_example_1" {
  location       = "eu" # multi-region scope
  cmek_config_id = "non_compliant_example_1"

  # Default CMEK for multi-regional "eu"
  kms_key        = "projects/735927692082/locations/eu/keyRings/my-ring/cryptoKeys/my-eu-key"

  project        = "735927692082"
  set_default    = true

  # Single-region CMEKs
  single_region_keys {
    kms_key = ""
  }
}


# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant
# Modify feilds allow_cross_region, agent_creation_config OR dialogflow_agent_to_link

#CMEK CONFIG Region C

resource "google_discovery_engine_cmek_config" "c" {
  location       = "eu" # multi-region scope
  cmek_config_id = "cmek_config_kms_key_region_test1_c"

  # Default CMEK for multi-regional "eu"
  kms_key        = "projects/735927692082/locations/eu/keyRings/my-ring/cryptoKeys/my-eu-key"

  project        = "735927692082"
  set_default    = true

  # Single-region CMEKs
  single_region_keys {
    kms_key = "projects/735927692082/locations/europe-west1/keyRings/my-ring/cryptoKeys/my-ew1-key"
  }

  single_region_keys {
    kms_key = "projects/735927692082/locations/europe-north1/keyRings/my-ring/cryptoKeys/my-en1-key"
  }
}




# Describe your resource type here
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant
# Modify feilds allow_cross_region, agent_creation_config OR dialogflow_agent_to_link

#CMEK CONFIG Region NC

resource "google_discovery_engine_cmek_config" "nc" {
  location       = "eu" # multi-region scope
  cmek_config_id = "cmek_config_kms_key_region_test1_nc"

  # Default CMEK for multi-regional "eu"
  kms_key        = "Wrong_Key"

  project        = "735927692082"
  set_default    = true

  # Single-region CMEKs
  single_region_keys {
    kms_key = "Wrong_Key1"
  }

  single_region_keys {
    kms_key = "Wrong_Key2"
  }
}


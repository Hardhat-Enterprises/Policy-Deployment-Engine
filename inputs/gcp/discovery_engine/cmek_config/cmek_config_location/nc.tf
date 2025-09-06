# Describe your resource type here
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant
# Modify feilds allow_cross_region, agent_creation_config OR dialogflow_agent_to_link

#CMEK CONFIG Location NC

resource "google_discovery_engine_cmek_config" "nc" {
  location       = "us"
  cmek_config_id = "cmek_config_location_test1_nc"

  kms_key        = "my-crypto-key"

  project        = "735927692082"
  set_default    = true
}


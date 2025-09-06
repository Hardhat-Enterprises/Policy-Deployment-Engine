# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant
# Modify feilds allow_cross_region, agent_creation_config OR dialogflow_agent_to_link

#CMEK CONFIG Location C

resource "google_discovery_engine_cmek_config" "c" {
  location       = "eu"
  cmek_config_id = "c"

  kms_key        = "my-crypto-key"

  project        = "735927692082"
  set_default    = true
}



# Describe your resource type here
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant
# Modify feilds allow_cross_region, agent_creation_config OR dialogflow_agent_to_link

#CMEK CONFIG NC

resource "google_discovery_engine_cmek_config" "nc" {
  location       = "eu"
  cmek_config_id = "nc"

  kms_key        = "wrong_key"

  project        = "735927692082"
  set_default    = true
}


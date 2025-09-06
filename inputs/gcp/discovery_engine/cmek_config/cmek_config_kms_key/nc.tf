
#CMEK CONFIG NC

resource "google_discovery_engine_cmek_config" "nc" {
  location       = "eu"
  cmek_config_id = "nc"

  kms_key        = "wrong_key"

  project        = "735927692082"
  set_default    = true
}


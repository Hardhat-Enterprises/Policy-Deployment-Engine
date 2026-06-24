
#CMEK CONFIG C

resource "google_discovery_engine_cmek_config" "nc" {
  location       = "eu"
  cmek_config_id = "nc"

  kms_key        = "nc-crypto-key"

  project        = "735927692082"
  set_default    = true
}



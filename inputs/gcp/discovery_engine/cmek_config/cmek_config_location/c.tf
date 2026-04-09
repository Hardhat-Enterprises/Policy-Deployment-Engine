
#CMEK CONFIG Location C

resource "google_discovery_engine_cmek_config" "c" {
  location       = "eu"
  cmek_config_id = "c"

  kms_key        = "my-crypto-key"

  project        = "735927692082"
  set_default    = true
}



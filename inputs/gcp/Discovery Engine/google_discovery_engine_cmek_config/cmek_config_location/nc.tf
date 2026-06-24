
#CMEK CONFIG Location NC

resource "google_discovery_engine_cmek_config" "nc" {
  location       = "us"
  cmek_config_id = "nc"

  kms_key        = "my-crypto-key"

  project        = "735927692082"
  set_default    = true
}


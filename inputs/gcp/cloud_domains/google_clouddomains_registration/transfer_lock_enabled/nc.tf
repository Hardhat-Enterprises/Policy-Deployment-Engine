resource "google_clouddomains_registration" "nc" {
  domain_name = "nc"
  location    = "global"

  management_settings {
    transfer_lock_state = "TRANSFER_LOCK_DISABLED"
  }
}

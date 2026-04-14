resource "google_clouddomains_registration" "c" {
  domain_name = "c"
  location    = "global"

  contact_settings {
    privacy = "PRIVATE_CONTACT_DATA"
  }

  management_settings {
    transfer_lock_state = "TRANSFER_LOCK_ENABLED"
    renewal_method      = "AUTOMATIC_RENEWAL"
  }
}

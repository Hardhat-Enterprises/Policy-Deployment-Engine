resource "google_clouddomains_registration" "nc" {
  domain_name = "nc"
  location    = "global"
  project     = "c"

  yearly_price {
    currency_code = "EUR" # Non-compliant
    units         = "12"
  }

  contact_settings {
    privacy = "PRIVATE_CONTACT_DATA"
    registrant_contact {
      email        = "admin@example.com"
      phone_number = "+61212345678"
      postal_address {
        region_code   = "AU"
        address_lines = ["1600 Amphitheatre Parkway"]
      }
    }
    admin_contact {
      email        = "admin@example.com"
      phone_number = "+61212345678"
      postal_address {
        region_code   = "AU"
        address_lines = ["1600 Amphitheatre Parkway"]
      }
    }
    technical_contact {
      email        = "admin@example.com"
      phone_number = "+61212345678"
      postal_address {
        region_code   = "AU"
        address_lines = ["1600 Amphitheatre Parkway"]
      }
    }
  }

  management_settings {
    transfer_lock_state      = "TRANSFER_LOCK_ENABLED"
    preferred_renewal_method = "AUTOMATIC_RENEWAL"
  }
}
resource "google_clouddomains_registration" "nc" {
  domain_name = "nc"
  location    = "global"

  # VIOLATION: region_code = "US" (not AU)
  contact_settings {
    privacy = "PRIVATE_CONTACT_DATA"
    registrant_contact {
      email        = "admin@example.com"
      phone_number = "+61212345678"
      postal_address {
        region_code = "US"
      }
    }
    admin_contact {
      email        = "admin@example.com"
      phone_number = "+61212345678"
      postal_address {
        region_code = "US"
      }
    }
    technical_contact {
      email        = "admin@example.com"
      phone_number = "+61212345678"
      postal_address {
        region_code = "US"
      }
    }
  }

  yearly_price {
    currency_code = "USD"
    units         = "12"
  }
}

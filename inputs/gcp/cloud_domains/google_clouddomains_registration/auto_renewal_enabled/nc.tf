resource "google_clouddomains_registration" "nc" {
  domain_name = "nc"
  location    = "global"

  contact_settings {
    privacy = "PRIVATE_CONTACT_DATA"
    registrant_contact {
      email        = "admin@example.com"
      phone_number = "+61212345678"
      postal_address {
        region_code = "AU"
      }
    }
    admin_contact {
      email        = "admin@example.com"
      phone_number = "+61212345678"
      postal_address {
        region_code = "AU"
      }
    }
    technical_contact {
      email        = "admin@example.com"
      phone_number = "+61212345678"
      postal_address {
        region_code = "AU"
      }
    }
  }

  yearly_price {
    currency_code = "USD"
    units         = "12"
  }

  # VIOLATION: preferred_renewal_method is RENEWAL_DISABLED
  management_settings {
    preferred_renewal_method = "RENEWAL_DISABLED"
  }
}

resource "google_clouddomains_registration" "nc" {
  domain_name = "nc"
  location    = "global"

  # VIOLATION: organization = "Hacker Inc"
  contact_settings {
    privacy = "PRIVATE_CONTACT_DATA"
    registrant_contact {
      email        = "admin@example.com"
      phone_number = "+61212345678"
      postal_address {
        region_code  = "AU"
        organization = "Hacker Inc"
      }
    }
    admin_contact {
      email        = "admin@example.com"
      phone_number = "+61212345678"
      postal_address {
        region_code  = "AU"
        organization = "Hacker Inc"
      }
    }
    technical_contact {
      email        = "admin@example.com"
      phone_number = "+61212345678"
      postal_address {
        region_code  = "AU"
        organization = "Hacker Inc"
      }
    }
  }

  yearly_price {
    currency_code = "USD"
    units         = "12"
  }
}

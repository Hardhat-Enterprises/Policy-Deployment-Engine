resource "google_clouddomains_registration" "c" {
  domain_name = "c"
  location    = "global"

  # Target attribute: organization = "Example Corp"
  contact_settings {
    privacy = "PRIVATE_CONTACT_DATA"
    registrant_contact {
      email        = "admin@example.com"
      phone_number = "+61212345678"
      postal_address {
        region_code  = "AU"
        organization = "Example Corp"
      }
    }
    admin_contact {
      email        = "admin@example.com"
      phone_number = "+61212345678"
      postal_address {
        region_code  = "AU"
        organization = "Example Corp"
      }
    }
    technical_contact {
      email        = "admin@example.com"
      phone_number = "+61212345678"
      postal_address {
        region_code  = "AU"
        organization = "Example Corp"
      }
    }
  }

  yearly_price {
    currency_code = "USD"
    units         = "12"
  }
}

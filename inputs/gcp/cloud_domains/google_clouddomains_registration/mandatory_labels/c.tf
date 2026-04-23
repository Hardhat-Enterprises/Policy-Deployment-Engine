resource "google_clouddomains_registration" "c" {
  domain_name = "c"
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

  # Target attribute: mandatory labels present
  labels = {
    env   = "prod"
    owner = "admin"
  }
}

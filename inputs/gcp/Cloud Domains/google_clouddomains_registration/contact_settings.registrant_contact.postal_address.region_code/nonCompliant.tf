resource "google_clouddomains_registration" "non_compliant_example_1" {
  domain_name = "non_compliant_example_1"
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

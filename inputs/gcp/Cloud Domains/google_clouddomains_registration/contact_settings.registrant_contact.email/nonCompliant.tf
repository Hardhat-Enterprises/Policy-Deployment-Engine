resource "google_clouddomains_registration" "non_compliant_example_1" {
  domain_name = "non_compliant_example_1"
  location    = "global"

  # VIOLATION: contact emails use personal gmail domain
  contact_settings {
    privacy = "PRIVATE_CONTACT_DATA"
    registrant_contact {
      email        = "user@gmail.com"
      phone_number = "+61212345678"
      postal_address {
        region_code = "AU"
      }
    }
    admin_contact {
      email        = "user@gmail.com"
      phone_number = "+61212345678"
      postal_address {
        region_code = "AU"
      }
    }
    technical_contact {
      email        = "user@gmail.com"
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
}

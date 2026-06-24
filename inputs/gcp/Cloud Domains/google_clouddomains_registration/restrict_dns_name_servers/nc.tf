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

  # VIOLATION: unauthorized name servers
  dns_settings {
    custom_dns {
      name_servers = ["ns1.unauthorized.com.", "ns2.unauthorized.com."]
    }
  }
}

resource "google_clouddomains_registration" "nc" {
  project     = "hardhat-project"
  domain_name = "nc"
  location    = "global"

  dns_settings {
    custom_dns {
      name_servers = ["ns1.hacker.com"] # VIOLATION: restrict_dns_name_servers
    }
  }

  contact_settings {
    privacy = "PRIVATE_CONTACT_DATA"
    registrant_contact {
      email        = "admin@example.com"
      phone_number = "+61212345678"
      postal_address {
        region_code   = "AU"
        address_lines = ["123 Eagle St"]
        locality      = "Brisbane"
        postal_code   = "4000"
        organization  = "Example Corp"
      }
    }
    admin_contact {
      email        = "admin@example.com"
      phone_number = "+61212345678"
      postal_address {
        region_code   = "AU"
        address_lines = ["123 Eagle St"]
        locality      = "Brisbane"
        postal_code   = "4000"
        organization  = "Example Corp"
      }
    }
    technical_contact {
      email        = "admin@example.com"
      phone_number = "+61212345678"
      postal_address {
        region_code   = "AU"
        address_lines = ["123 Eagle St"]
        locality      = "Brisbane"
        postal_code   = "4000"
        organization  = "Example Corp"
      }
    }
  }

  management_settings {
    transfer_lock_state      = "TRANSFER_LOCK_ENABLED"
    preferred_renewal_method = "AUTOMATIC_RENEWAL"
  }

  yearly_price {
    currency_code = "USD"
    units         = "12"
  }

  domain_notices = ["HSTS_PRELOADED"]

  labels = {
    env   = "prod"
    owner = "admin"
  }
}

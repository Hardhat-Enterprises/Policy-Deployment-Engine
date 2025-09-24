package network_services.helpers

# DNS resolvers (Cloudflare + Google)
dns_allowlist := {
  "1.1.1.1",
  "1.0.0.1",
  "8.8.8.8",
  "8.8.4.4"
}

# Egress allowlist (private nets + DNS)
egress_allowlist := {
  "10.0.0.0/8",
  "172.16.0.0/12",
  "192.168.0.0/16",
  "1.1.1.1/32",
  "1.0.0.1/32",
  "8.8.8.8/32",
  "8.8.4.4/32"
}

# SMTP relay allowlist (test IPs, replace later)
smtp_allowlist := {
  "198.51.100.20",
  "203.0.113.25"
}

# ---------------------------------------------------
# Helper function to format range validation messages
# ---------------------------------------------------
format_range_validation_message(field, value, min, max) := msg if {
  msg := sprintf("Field '%v' with value '%v' is out of range. Allowed range is [%v - %v].", [field, value, min, max])
}

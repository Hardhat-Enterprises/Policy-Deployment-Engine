resource "google_identity_platform_inbound_saml_config" "nc" {
  project      = "identity_platform"
  name         = "saml.deakin"
  display_name = ""  # This will trigger a validation error. Must be non-empty.

  idp_config {
    idp_entity_id = "https://idp.deakin.edu.au/entity"
    sso_url       = "https://idp.deakin.edu.au/sso"
    idp_certificates {
      x509_certificate = <<EOT
-----BEGIN CERTIFICATE-----
MIIDdzCCAl+gAwIBAgIEbM3gdzANBgkqhkiG9w0BAQsFADBoMQswCQYDVQQGEwJB
VTETMBEGA1UECBMKU29tZS1TdGF0ZTETMBEGA1UEBxMKU29tZS1DaXR5MRQwEgYD
VQQKEwtFeGFtcGxlIEluYzERMA8GA1UEAxMIZGVha2luLmlkMB4XDTIxMDYxNzAw
MDAwMFoXDTMxMDYxNzAwMDAwMFowaDELMAkGA1UEBhMCQVUxEzARBgNVBAgTClNv
bWUtU3RhdGUxEzARBgNVBAcTClNvbWUtQ2l0eTEUMBIGA1UEChMLRXhhbXBsZSBJ
bmMxETAPBgNVBAMTCGRlYWtpbi5pZDCCASIwDQYJKoZIhvcNAQEBBQADggEPADCC
AQoCggEBAKNcdzHv6RcU+e9Wrs6fqlnErFwzIzfdghOkeNDZQJgwKDmHAmzVpWZ2
6cz1pKIVDqZ8C4gJt6v+Bl9Wq0cNpL3Lbs1hPX6gSwFVdo0kqDbS4QpQdG9B+Z0m
NdnXBqU2iR+WGeYJl42aHLj0tYkBvBb6iZg6zSZo9qMEnya1x3z6M6J0DUqN0EId
FwFAT8eDH80q1jWEVbV7gMof9oGwSfj4rQMuCBYpl9D5UpG+KQROosZsFoPb0b6s
x29tzkdCIWa91qF+yISzDK90OvVZyZ8DYwrKc3eEf3kZ8zMzUATZ9ZzSHqmdcWxi
+7+Jq49etI3qxvv+rUyXs2JMP+9YkVsCAwEAAaMhMB8wHQYDVR0OBBYEFKqIoXL5
cYURutRzD6LJwZD8akBsMA0GCSqGSIb3DQEBCwUAA4IBAQAg0xwL/g==
-----END CERTIFICATE-----
EOT
    }
  }

  sp_config {
    sp_entity_id = "https://identitytoolkit.googleapis.com/google.identity.identitytoolkit.v1.SamlIdpConfig/saml.deakin"
    callback_uri = "https://your-project.firebaseapp.com/__/auth/handler"
  }
}

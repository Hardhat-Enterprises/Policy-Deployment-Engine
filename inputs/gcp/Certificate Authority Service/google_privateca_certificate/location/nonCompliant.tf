resource "tls_private_key" "non_compliant_key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

resource "tls_cert_request" "non_compliant_request" {
  private_key_pem = tls_private_key.non_compliant_key.private_key_pem

  subject {
    common_name  = "example.com"
    organization = "Example"
  }
}

resource "google_privateca_certificate" "non_compliant_example_1" {
  name                  = "non-compliant-certificate"
  location              = "us-central1"
  pool                  = "example-pool"
  certificate_authority = "example-ca"
  lifetime              = "86000s"
  pem_csr               = tls_cert_request.non_compliant_request.cert_request_pem
}

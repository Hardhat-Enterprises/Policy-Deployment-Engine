resource "tls_private_key" "compliant_key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

resource "tls_cert_request" "compliant_request" {
  private_key_pem = tls_private_key.compliant_key.private_key_pem

  subject {
    common_name  = "example.com"
    organization = "Example"
  }
}

resource "google_privateca_certificate" "compliant_example_1" {
  name                  = "compliant-certificate"
  location              = "australia-southeast1"
  pool                  = "example-pool"
  certificate_authority = "example-ca"
  lifetime              = "86000s"
  pem_csr               = tls_cert_request.compliant_request.cert_request_pem
}

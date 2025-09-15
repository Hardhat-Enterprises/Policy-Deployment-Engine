# Compliant Firebase project with rate limiting enabled
resource "null_resource" "c" {
  triggers = {
    rate_limit = true
    name       = "compliant-rate-limit"
  }
}
# Non-compliant Firebase project without rate limiting
resource "null_resource" "nc" {
  triggers = {
    rate_limit = false
    name       = "non-compliant-rate-limit"
  }
}
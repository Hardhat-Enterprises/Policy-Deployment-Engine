# Non-compliant Firebase Authentication with anonymous sign-in enabled
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "null_resource" "nc" {
  triggers = {
    allow_anonymous = "true"
    name            = "mock-nc"
  }
}


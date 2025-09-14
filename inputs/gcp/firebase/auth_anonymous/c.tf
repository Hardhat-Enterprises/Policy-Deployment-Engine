# Compliant Firebase Authentication with anonymous sign-in disabled
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "null_resource" "c" {
  triggers = {
    allow_anonymous = "false"
    name            = "mock-c"
  }
}


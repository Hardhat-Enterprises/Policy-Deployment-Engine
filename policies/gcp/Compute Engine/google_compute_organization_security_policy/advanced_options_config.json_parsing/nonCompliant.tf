# Describe your resource type here.
# Label the resource(s) under test non_compliant_example_1, non_compliant_example_2, ...
# (sequential, in order; always suffixed with _1 even when there is only one).
#
# Only the tested resource type may appear in this file — no dependency resources.
# We run `terraform plan` only, so point at fake addresses/values instead of
# creating real dependencies.

resource "google_compute_organization_security_policy" "non_compliant_example_1" {
  short_name = "non_compliant_example_1"
  parent     = "organizations/123456789"
  type       = "CLOUD_ARMOR"

  advanced_options_config {
    json_parsing = "DISABLED"
  }
}

# Describe your resource type here.
# Label the resource(s) under test non_compliant_example_1, non_compliant_example_2, ...
# (sequential, in order; always suffixed with _1 even when there is only one).
#
# Only the tested resource type may appear in this file — no dependency resources.
# We run `terraform plan` only, so point at fake addresses/values instead of
# creating real dependencies.

resource "google_compute_network_firewall_policy_rule" "non_compliant_example_1" {
  action          = "allow"
  direction       = "EGRESS"
  firewall_policy = "fake-policy-id"
  priority        = 1000

  match {
    dest_region_codes = ["RU"]

    layer4_configs {
      ip_protocol = "all"
    }
  }
}

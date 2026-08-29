# Describe your resource type here.
# Label the resource(s) under test compliant_example_1, compliant_example_2, ...
# (sequential, in order; always suffixed with _1 even when there is only one).
#
# Only the tested resource type may appear in this file — no dependency resources.
# We run `terraform plan` only, so point at fake addresses/values instead of
# creating real dependencies.

resource "RESOURCE_TYPE" "compliant_example_1" {

}

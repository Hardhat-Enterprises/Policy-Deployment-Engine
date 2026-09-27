# Compute Router Route Policy — deletion_policy under test.
# Only the tested resource type appears here; router/region point at fake
# values instead of creating real dependency resources.
resource "google_compute_router_route_policy" "non_compliant_example_1" {
  name            = "noncompliant-route-policy-1"
  router          = "fake-router-1"
  region          = "australia-southeast1"
  type            = "ROUTE_POLICY_TYPE_EXPORT"
  deletion_policy = "DELETE"

  terms {
    priority = 1
    match {
      expression = "destination == '10.0.0.0/12'"
    }
    actions {
      expression = "accept()"
    }
  }
}

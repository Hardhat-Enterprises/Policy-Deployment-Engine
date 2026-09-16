# Compute Router Route Policy — region under test.
# Only the tested resource type appears here; router points at a fake
# value instead of creating a real dependency resource.
resource "google_compute_router_route_policy" "non_compliant_example_1" {
  name   = "noncompliant-route-policy-1"
  router = "fake-router-1"
  region = "us-central1"
  type   = "ROUTE_POLICY_TYPE_EXPORT"

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

# Describe your resource type here
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_iam_workload_identity_pool_provider" "nc" {
  workload_identity_pool_id          = "pid"
  workload_identity_pool_provider_id = "wipp-nc"
  project = "pro"
  display_name                       = "Name of provider"
  description                        = "OIDC identity pool provider for automated test"
  disabled                           = true
  attribute_condition                = "\"e968c2ef-047c-498d-8d79-16ca1b61e77e\" in assertion.groups"
  attribute_mapping                  = {
    "google.subject"                  = "\"azure::\" + assertion.tid + \"::\" + assertion.sub"
    "attribute.tid"                   = "assertion.tid"
    "attribute.managed_identity_name" = <<EOT
      {
        "8bb39bdb-1cc5-4447-b7db-a19e920eb111":"workload1",
        "55d36609-9bcf-48e0-a366-a3cf19027d2a":"workload2"
      }[assertion.oid]
EOT
  }
  oidc {
    allowed_audiences = ["https://example.com/gcp-oidc-federation", "example.com/gcp-oidc-federation", "NAH"]
    issuer_uri        = "http://sts.wind0ws.net/azure-tenant-id"
  }
}
# Describe your resource type here
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_discovery_engine_acl_config" "nc" {
  location = "eu"
  id = "1"
  idp_config {
    idp_type = "THIRD_PARTY"
    external_idp_config {
      workforce_pool_name = "locations/global/workforcePools/cloud-console-pool-manual"
    }
  }
}
# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_discovery_engine_acl_config" "c" {
  location = "eu"
    id = "1"
  idp_config {
    idp_type = "THIRD_PARTY"
    external_idp_config {
      workforce_pool_name = "locations/global/workforcePools/cloud-console-pool-manual"
    }
  }
}
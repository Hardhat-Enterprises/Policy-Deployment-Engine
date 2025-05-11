package terraform.gcp.security.azurecluster.cluster.azure_region_whitelist

import data.terraform.gcp.helpers

# Whitelisted regions
approved_regions := {
  "australia-southeast1",
  "us-central1"
}

violation[r] {
  helpers.resource_type(r, "google_container_azure_cluster")
  not helpers.value_in_whitelist(r, "azure_region", approved_regions)
}
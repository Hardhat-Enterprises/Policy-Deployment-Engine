package terraform.gcp.security.azurecluster.cluster.azure_region_whitelist

import data.terraform.gcp.helpers
import data.terraform.gcp.security.azurecluster.cluster.vars

resource_type := "google_container_azure_cluster"
friendly_resource_name := "GCP Azure Cluster"

attribute_path := "azure_region"
compliant_values := [
    "australia-southeast1",
    "us-central1",
    "europe-west1"
]

summary := helpers.get_summary(
    resource_type,
    attribute_path,
    compliant_values,
    friendly_resource_name
)

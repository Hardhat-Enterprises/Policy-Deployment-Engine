package terraform.gcp.security.compute.google_container_cluster.Private_cluster_config # Edit here 
import data.terraform.gcp.helpers
import data.terraform.gcp.security.compute.google_container_cluster.vars


compliance_conditions := [
  {
    "attribute_path": ["private_cluster_config", 0, "master_global_access_config", 0, "enabled"],
    "compliant_values": [false]
  },
  {
    "attribute_path": ["private_cluster_config", 0, "enable_private_nodes"],
    "compliant_values": [true]
  }
]



summary := helpers.get_multi_summary(vars.resource_type, compliance_conditions, vars.friendly_resource_name)

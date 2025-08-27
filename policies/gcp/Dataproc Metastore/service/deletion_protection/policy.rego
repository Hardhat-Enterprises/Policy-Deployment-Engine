package terraform.gcp.security.dataproc_metastore.service.deletion_protection
import data.terraform.gcp.helpers
import data.terraform.gcp.security.metastore.service.vars


conditions := [
[
  {
    "situation_description": "Metastore is not protected against accidental deletions.",
    "remedies": ["Turn on deletion protection to prevent this"],
  },
  {
    "condition": "Check if the metastore is protected against accidental deletion.",
    "attribute_path": ["resources", "values", 0, "deletion_protection"],
    "values": [true],
    "policy_type": "whitelist"
  }
]
]

# Displays a general message about policy compliance
# Use 'opa eval ... "data.terraform.gcp.security.<service>.<resource_type>.<policy_name>.message"
message := helpers.get_multi_summary(conditions, vars.variables).message

# Displays a detailed summary of each resources compliance to every condition and situation
# Useful for debugging
# Use 'opa eval ... "data.terraform.gcp.security.<service>.<resource_type>.<policy_name>.details"
details := helpers.get_multi_summary(conditions, vars.variables).details
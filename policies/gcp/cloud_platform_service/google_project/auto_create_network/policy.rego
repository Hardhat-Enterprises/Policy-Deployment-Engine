package terraform.gcp.security.cloud_platform_service.google_project.auto_create_network

import data.terraform.gcp.helpers
import data.terraform.gcp.security.cloud_platform_service.google_project.vars

# Enforce: auto_create_network must be false
conditions := [
  [
    {
      "situation_description": "Projects must not auto-create a default network.",
      "remedies": ["Set auto_create_network = false to avoid insecure default network."]
    },
    {
      "condition": "Default network is being created",
      "attribute_path": ["auto_create_network"],
      "values": [false],
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


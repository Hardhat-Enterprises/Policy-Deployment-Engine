# package terraform.gcp.security.<service>.<resource_type>.<policy_name> # Edit here 
package terraform.gcp.security.compute.instance.deletion_protection
import data.terraform.gcp.helpers
# import data.terraform.gcp.security.<service>.<resource_type>.vars
import data.terraform.gcp.security.compute.instance.vars

# STEP 1: STUDY YOUR RESOURCE AND ITS ATTRIBUTES, THEN FILL IN THE VARS FILE

# STEP 2: CREATE SCENARIOS (can be simple (one condition) or complex (multiple linked conditions) )
conditions := [
  [
    {
      "situation_description": "Instance does not have deletion protection enabled",
      "remedies": [
        "Set 'deletion_protection = true' for critical or production instances"
      ]
    },
    {
      "condition": "deletion_protection must be true",
      "attribute_path": ["deletion_protection"],
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
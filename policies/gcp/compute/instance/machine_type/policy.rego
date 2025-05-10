# package terraform.gcp.security.<service>.<resource_type>.<policy_name> # Edit here 
package terraform.gcp.security.compute.instance.machine_type
import data.terraform.gcp.helpers
import data.terraform.gcp.security.compute.instance.vars

# STEP 1: STUDY YOUR RESOURCE AND ITS ATTRIBUTES, THEN FILL IN THE VARS FILE

# STEP 2: CREATE SCENARIOS (can be simple (one condition) or complex (multiple linked conditions) )

conditions := [
  [
    {
      "situation_description": "Unsupported or custom machine type is used",
      "remedies": [
        "Use only approved types containing: 'e2-standard-2', 'e2-micro', 'e2-medium', or 'n1-small'"
      ]
    },
    {
      "condition": "machine_type must contain one of the approved patterns",
      "attribute_path": ["machine_type"],
      "values": ["e2-standard-2", "e2-micro", "e2-medium", "n1-small"],
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
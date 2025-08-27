#package terraform.gcp.security.data.dataproc_metastore.service.database_type # Edit here 
#import data.terraform.gcp.helpers
#import data.terraform.gcp.security.metastore.service.vars

package terraform.gcp.security.dataproc_metastore.service.database_type
import data.terraform.gcp.helpers
import data.terraform.gcp.security.dataproc_metastore.service.vars


conditions := [
  [
    {
      "situation_description": "Check that the database meets requirements",
      "remedies": ["Database type must be MYSQL or SPANNER"]
    },
    {
      "condition": "check database type is compliant",
      "attribute_path": ["database_type"],
      "values": ["MYSQL","SPANNER"],
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
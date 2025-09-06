package terraform.gcp.security.alloydb.google_alloydb_cluster.deletion_policy
import data.terraform.gcp.helpers
import data.terraform.gcp.security.alloydb.google_alloydb_cluster.vars

conditions := [
  [
    {
      "situation_description": "AlloyDB Cluster is configured with deletion_policy set to DESTROY.",
      "remedies": [
        "Change deletion_policy to 'RETAIN' or another safe value to prevent accidental deletion of the cluster."
      ]
    },
    {
      "condition": "deletion_policy must not be DESTROY",
      "attribute_path": ["deletion_policy"],
      "values": ["DESTROY"],
      "policy_type": "blacklist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details

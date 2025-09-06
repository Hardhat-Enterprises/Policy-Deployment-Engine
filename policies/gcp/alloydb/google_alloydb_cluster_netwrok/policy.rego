package terraform.gcp.security.alloydb.google_alloydb_cluster.cluster_network
import data.terraform.gcp.helpers
import data.terraform.gcp.security.alloydb.google_alloydb_cluster.vars

conditions := [
  [
    {
      "situation_description": "AlloyDB Cluster has no VPC specified in network_config.network.",
      "remedies": ["Set network_config.network to a valid VPC self link."]
    },
    {
      "condition": "network must be present and non empty",
      "attribute_path": ["network_config", 0, "network"],
      "values": [null, ""],
      "policy_type": "blacklist"
    }
  ],
  [
    {
      "situation_description": "AlloyDB Cluster must use an approved VPC.",
      "remedies": ["Use one of the approved VPC self links."]
    },
    {
      "condition": "network must be one of the approved VPCs",
      "attribute_path": ["network_config", 0, "network"],
      "values": [
        "projects/pde-demo/global/networks/prod-vpc",
        "projects/shared-host-project/global/networks/shared-vpc"
      ],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details

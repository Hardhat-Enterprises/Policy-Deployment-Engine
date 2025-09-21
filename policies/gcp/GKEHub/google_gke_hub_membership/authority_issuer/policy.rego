package terraform.gcp.security.gke_hub.google_gke_hub_membership.authority_issuer
import data.terraform.gcp.helpers
import data.terraform.gcp.security.gke_hub.google_gke_hub_membership.vars

conditions := [
  [ 
    {
      "situation_description": "Membership has no Workload Identity issuer configured",
      "remedies": ["authority.issuer MUST not be empty"]
    },
    {
      "condition": "authority.issuer must NOT be empty",
      "attribute_path": ["authority",0,"issuer"],
      "values": [""],
      "policy_type": "blacklist"
    }
  ],

  [ 
    {
      "situation_description": "Membership issuer is not an approved Workload Identity trust domain",
      "remedies": [ "authority.issuer MUST match your project/location/cluster"]
    },
    {
      "condition": "issuer must match approved project/location/cluster pattern",
      "attribute_path": ["authority",0,"issuer"],
      "values": [
        "https://container.googleapis.com/v1/projects/*/locations/*/clusters/*",
        [["a1","a2","a3"],["australia-southeast1","australia-southeast2"],["prod-cluster","test-cluster"]]
      ],
      "policy_type": "pattern whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details


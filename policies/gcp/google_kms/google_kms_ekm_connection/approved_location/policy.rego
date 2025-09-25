package terraform.gcp.security.google_kms.google_kms_ekm_connection.approved_location
import data.terraform.gcp.helpers as helpers
import data.terraform.gcp.security.google_kms.google_kms_ekm_connection.vars as vars

conditions := [
  
    [
    {
      "situation_description": "EKM connection must live in an approved Australian region",
      "remedies": [
        "Use one of the approved Australia KMS regions: australia-southeast1 or australia-southeast2",
        "If you require another region, request it be whitelisted"
      ]
    },
    {
      "condition":      "Approved Australian regions only",
      "attribute_path": ["location"],
      "values":         ["australia-southeast1", "australia-southeast2"],
      "policy_type":    "whitelist"
    }
    ],

  
    [
    {
      "situation_description": "EKM connection directory path must follow the approved pattern",
      "remedies": [
        "Use a service_directory_service matching 'projects/*/locations/<au-region>/namespaces/...'",
        "If you need a different namespace or region, request it be whitelisted"
      ]
    },
    {
      "condition":      "Pattern whitelist for directory path",
      "attribute_path": ["service_resolvers", 0, "service_directory_service"],
      "values": ["projects/my-project/locations/*/namespaces/ns/services/svc",[["australia-southeast1","australia-southeast2"]]],
      "policy_type":    "pattern whitelist"
      
      
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
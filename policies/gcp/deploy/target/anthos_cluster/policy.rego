package terraform.gcp.security.deploy.target.anthos_cluster
import data.terraform.gcp.helpers
import data.terraform.gcp.security.deploy.target.vars

conditions := [
    [
        {
            "situation_description": "Anthos cluster membership doesn't follow security naming conventions",
            "remedies": ["Use approved cluster membership naming that includes security classification"]
        },
        {
            "condition": "Anthos cluster membership must follow secure naming convention",
            "attribute_path": ["anthos_cluster", 0, "membership"],
            "values": [
                "projects/my-project/locations/us-central1/memberships/prod-secure-hybrid-cluster"
            ],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details
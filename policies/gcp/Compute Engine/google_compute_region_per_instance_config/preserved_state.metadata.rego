package terraform.gcp.security.compute_engine.google_compute_region_per_instance_config.preserved_state.metadata
import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_region_per_instance_config.vars

conditions := [
    [
        {
            "situation_description": "preserved_state.metadata contains secrets or sensitive information in plaintext",
            "remedies": [
                "Use more secure methods to store sensitive information and secrets such as the Secret Manager"
            ]
        },
        {
            "condition": "Senstitive information keywords in plaintext must not be containted in metadata",
            "attribute_path": ["preserved_state", 0, "metadata", "password"],
            "values": ["*", [["password"]]],
            "policy_type": "pattern blacklist"
        },
        {
            "condition": "Senstitive information keywords in plaintext must not be containted in metadata",
            "attribute_path": ["preserved_state", 0, "metadata", "api_key"],
            "values": ["*", [["api_key"]]],
            "policy_type": "pattern blacklist"
        },
        {
            "condition": "Senstitive information keywords in plaintext must not be containted in metadata",
            "attribute_path": ["preserved_state", 0, "metadata", "access_token"],
            "values": ["*", [["access_token"]]],
            "policy_type": "pattern blacklist"
        }
    ]
    
    
]

result  := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
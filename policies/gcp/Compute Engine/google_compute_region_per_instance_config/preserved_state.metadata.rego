package terraform.gcp.security.compute_engine.google_compute_region_per_instance_config.preserved_state_metadata
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
            "condition": "Metadata variables that are associated with sensitive data must not contain information in plaintext",
            "attribute_path": ["preserved_state", 0, "metadata", "password"],
            "values": ["", null],
            "policy_type": "whitelist"
        },
        {
            "condition": "Metadata variables that are associated with sensitive data must not contain information in plaintext",
            "attribute_path": ["preserved_state", 0, "metadata", "api_key"],
            "values": ["", null],
            "policy_type": "whitelist"
        },
        {
            "condition": "Metadata variables that are associated with sensitive data must not contain information in plaintext",
            "attribute_path": ["preserved_state", 0, "metadata", "access_token"],
            "values": ["", null],
            "policy_type": "whitelist"
        }
    ]
    
    
]

result  := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
package terraform.gcp.security.compute_engine.google_compute_region_per_instance_config.remove_instance_state_on_destroy
import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_region_per_instance_config.vars

conditions := [
    [
        {
            "situation_description": "remove_instance_state_on_destroy is configured to be TRUE",
            "remedies": [
                "Configure remove_instance_state_on_destroy to false"
            ]
        },
        {
            "condition": "remove_instance_on_destroy must be configured to false",
            "attribute_path": ["remove_instance_state_on_destroy"],
            "values": [true],
            "policy_type": "blacklist"
        }
    ]
]

result  := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
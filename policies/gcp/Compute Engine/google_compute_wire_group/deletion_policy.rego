package terraform.gcp.security.compute_engine.google_compute_wire_group.deletion_policy
import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_wire_group.vars
conditions := [
    [
        {
            "situation_description": "The wire group's deletion_policy allows the resource to be destroyed via terraform destroy or apply, risking accidental removal of active network connectivity configuration.",
            "remedies": [
                "Set deletion_policy to PREVENT in the google_compute_wire_group resource.",
                "This blocks accidental deletion via terraform destroy or apply.",
                "Consult Google Cloud documentation on deletion_policy for details."
            ]
        },
        {
            "condition": "Check if deletion_policy is set to PREVENT",
            "attribute_path": ["deletion_policy"],
            "values": ["PREVENT"],
            "policy_type": "Whitelist"
        }
    ]
]
result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
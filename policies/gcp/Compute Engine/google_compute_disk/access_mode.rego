package terraform.gcp.security.compute_engine.google_compute_disk.access_mode
import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_disk.vars
conditions := [
    [
        {
            "situation_description": "Compute disk uses an access mode that allows multi-instance read-write attachment, widening the surface for data tampering if any attached instance is compromised.",
            "remedies": ["Set access_mode to READ_WRITE_SINGLE unless multi-writer access is explicitly required for the workload."]
        },
        {
            "condition": "access_mode must be an approved single-attach mode.",
            "attribute_path": ["access_mode"],
            "values": ["READ_WRITE_SINGLE", "READ_ONLY_SINGLE"],
            "policy_type": "whitelist"
        }
    ]
]
result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
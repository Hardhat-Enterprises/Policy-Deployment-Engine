package terraform.gcp.security.healthcare.hl7_v2_store.labels
import data.terraform.gcp.security.healthcare.hl7_v2_store.vars
import data.terraform.gcp.helpers

scenarios_list := [
    [
        {
            "situation_description": "Sensitive or non-approved label keys found in HL7v2 store.",
            "remedies": [
                "Use only approved label keys such as 'environment' and 'service'.",
                "Avoid including sensitive identifiers like 'patient_id', 'ssn', 'medicare', 'user_id', 'confidential', or other PII in labels."
            ]
        },
        {
            "condition": "non-compliant label keys",
            "attribute_path": ["labels"],
            "values": ["patient_id", "ssn", "user_id", "confidential", "pii", "medicare", "medicare_number", "mygov_id"],
            "policy_type": "blacklist"
        }
    ]
]

message := helpers.get_multi_summary(scenarios_list, vars.variables).message

details := helpers.get_multi_summary(scenarios_list, vars.variables).details
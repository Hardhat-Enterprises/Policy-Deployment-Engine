package terraform.gcp.security.cloud_healthcare.google_healthcare_pipeline_job.disable_lineage

import data.terraform.helpers
import data.terraform.gcp.security.cloud_healthcare.google_healthcare_pipeline_job.vars

# Validate that disable_lineage is false.
# Lineage tracking records data provenance — the origin and transformation
# history of each FHIR resource produced by the pipeline. Disabling it
# removes the ability to audit how PHI records were created and merged,
# breaking HIPAA data integrity requirements.
conditions := [
    [
    {"situation_description" : "Pipeline Job has disable_lineage set to true — data provenance audit trail is lost",
    "remedies": [
        "Set disable_lineage to false to retain full data provenance tracking",
        "Lineage is required to audit how PHI records were created and merged through the pipeline"
    ]},
    {
        "condition": "Check if disable_lineage is not true",
        "attribute_path" : ["disable_lineage"],
        "values" : [true],
        "policy_type" : "blacklist"
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details

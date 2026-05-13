package terraform.gcp.security.Storage_Transfer_Service.google_storage_transfer_job.vars

variables := {
    "friendly_resource_name": "Storage Transfer job",
    "resource_type": "google_storage_transfer_job",
    "approved_source_agent_pool_names": [
        "projects/my-project-123/agentPools/approved-pool"
    ],
    "approved_role_arns": [
        "arn:aws:iam::123456789012:role/sts-transfer-role"
    ],
    "arguments": {
        "description": "description",
        "project": "project",
        "status": "status",
        "overwrite_when": "overwrite_when",
        "role_arn": "role_arn"
    }
}
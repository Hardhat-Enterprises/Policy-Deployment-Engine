package terraform.gcp.security.cloud_run_v2_api.google_cloud_run_v2_service.template_volumes_nfs_read_only
import data.terraform.helpers
import data.terraform.gcp.security.cloud_run_v2_api.google_cloud_run_v2_service.vars

conditions := [
    [
        {
            "situation_description": "NFS volume mount is not set to read-only, allowing unauthorized data modification through write operations.",
            "remedies": ["Set template.volumes.nfs.read_only to true to enforce read-only access to mounted NFS volumes."]
        },
        {
            "condition": "NFS volume read_only must be true",
            "attribute_path": ["template",0,"volumes",0,"nfs",0,"read_only"],
            "values": [true],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
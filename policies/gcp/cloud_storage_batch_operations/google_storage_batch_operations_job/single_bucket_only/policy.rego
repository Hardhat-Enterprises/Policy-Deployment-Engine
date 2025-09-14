package terraform.gcp.security.cloud_storage_batch_operations.google_storage_batch_operations_job.single_bucket_only

import data.terraform.gcp.helpers
import data.terraform.gcp.security.cloud_storage_batch_operations.google_storage_batch_operations_job

conditions := [
  [
    {
      "situation_description": "Multiple buckets specified (unsupported/unsafe)",
      "remedies": [
        "Use only one bucket in bucket_list.buckets",
        "Split into separate batch operations jobs if multiple buckets needed"
      ]
    },
    {
      "condition": "second bucket must not exist",
      "attribute_path": ["bucket_list", 0, "buckets", 1, "bucket"],
      "values": ["*"],
      "policy_type": "pattern blacklist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, data.terraform.gcp.security.cloud_storage_batch_operations.google_storage_batch_operations_job.variables).message
details := helpers.get_multi_summary(conditions, data.terraform.gcp.security.cloud_storage_batch_operations.google_storage_batch_operations_job.variables).details

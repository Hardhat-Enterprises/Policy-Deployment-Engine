package terraform.gcp.security.google_cloudfunction.google_cloudfunctions2_function_iam.cloud_function
import data.terraform.gcp.helpers
import data.terraform.gcp.security.google_cloudfunction.google_cloudfunctions2_function_iam.google_cloudfunctions2_function_iam_policy.vars


conditions := [
  [
    {
      "situation_description": "IAM policy is missing a valid target cloud function.",
      "remedies": [
        "Specify the 'cloud_function' attribute in your IAM policy resource.",
        "Ensure it references a valid Cloud Function name."
      ]
    },
    {
      "condition": "Cloud Function reference must be a valid function.",
      "attribute_path": ["cloud_function"],
      "values": [
        "google_cloudfunctions2_function_01"
      ],
      "policy_type": "whitelist"
    }
  ]
]
message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
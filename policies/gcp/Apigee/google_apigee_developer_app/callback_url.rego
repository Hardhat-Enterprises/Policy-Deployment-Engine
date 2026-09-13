package terraform.gcp.security.apigee.google_apigee_developer_app.callback_url
import data.terraform.helpers
import data.terraform.gcp.security.apigee.google_apigee_developer_app.vars
conditions := [
    [
        {
            "situation_description": "callback_url must use HTTPS to prevent credential and token theft via man-in-the-middle attacks",
            "remedies": [
                "Set callback_url to a URL starting with https:// to enforce secure OAuth redirect endpoints"
            ]
        },
        {
            "condition": "check callback_url does not use insecure HTTP protocol",
            "attribute_path": ["callback_url"],
            "values": [
                "*://*",
                [
                    ["http"],
                    []
                ]
            ],
            "policy_type": "pattern blacklist"
        }
    ]
]
result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details

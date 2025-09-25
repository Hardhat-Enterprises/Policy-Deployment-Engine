package terraform.gcp.security.application_integration.google_integrations_auth_config.decrypted_credential.jwt.jwt_header

import data.terraform.gcp.helpers
import data.terraform.gcp.security.application_integration.google_integrations_auth_config.vars

conditions := [
  [
    {
      "situation_description": "JWT header must use 'HS256' algorithm and type must be 'JWT'",
      "remedies": ["Set jwt_header algorithm to 'HS256'","Ensure jwt_header type is 'JWT'"
      ]
    },
    {
      "condition": "jwt_header must contain alg=HS256 and typ=JWT",
      "attribute_path": ["decrypted_credential",0, "jwt",0, "jwt_header"],
      "values": [
        "{\"alg\": \"*\", \"typ\": \"*\"}",
        [["HS256"], ["JWT"]]
      ],
      "policy_type": "pattern whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details

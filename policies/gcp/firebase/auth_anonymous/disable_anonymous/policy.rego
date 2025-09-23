package terraform.gcp.security.firebase.auth_anonymous.disable_anonymous

import data.terraform.gcp.helpers
import data.terraform.gcp.security.firebase.auth_anonymous.vars

conditions := [
       [
           {
               "situation_description": "Rules allow public read or write",
               "remedies": ["Restrict database rules to authenticated users only"]
           },
           {
               "condition": "Check if rules allow public read or write",
               "attribute_path": ["values", "sign_in", 0, "anonymous", 0, "enabled"],

               "values": [false],
               "policy_type": "whitelist"
           }
       ]
   ]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details

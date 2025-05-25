package terraform.gcp.security.API.IAM_Gateway_Config.Member

import data.terraform.gcp.security.API.IAM.vars

compliant_members := {
  "user:user@gmail.com"
}

non_compliant[res.name] if {
  res := input.planned_values.root_module.resources[_]
  res.type == vars.resource_type
  not res.values.member in compliant_members
}

summary := {
  "message": [
    sprintf("Total IAM Member resources detected: %v", [count({r | r := input.planned_values.root_module.resources[_]; r.type == vars.resource_type})]),
    sprintf("Non-compliant IAM Member resources: %v", [count(non_compliant)])
  ],
  "details": [
    {
      "resource": res.name,
      "reason": sprintf("IAM member '%v' is not allowed", [res.values.member])
    } |
    res := input.planned_values.root_module.resources[_]
    res.type == vars.resource_type
    not res.values.member in compliant_members
  ]
}

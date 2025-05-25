package terraform.gcp.security.API.Gateway_Config.managed_service_configs

import data.terraform.gcp.security.API.Gateway_Config.managed_service_configs.vars

compliant_path := "service-config.json"
resource_type := vars.resource_type

# Collect non-compliant resource names and reasons
violations[{
  "resource": res.name,
  "reason": sprintf("Path in managed_service_configs is '%v'. It should be '%v'", [res.values.managed_service_configs[i].path, compliant_path])
}] if {
  res := input.planned_values.root_module.resources[_]
  res.type == resource_type
  some i
  res.values.managed_service_configs[i].path != compliant_path
}

summary := {
  "message": [
    sprintf("Total API Gateway Managed Service Config detected: %v", [count({r | r := input.planned_values.root_module.resources[_]; r.type == resource_type})]),
    sprintf("Non-compliant API Gateway Managed Service Config: %v/%v", [count(violations), count({r | r := input.planned_values.root_module.resources[_]; r.type == resource_type})])
  ],
  "details": violations
}

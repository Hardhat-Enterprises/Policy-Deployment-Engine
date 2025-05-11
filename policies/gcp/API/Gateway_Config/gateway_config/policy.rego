package terraform.gcp.security.API.Gateway_Config.gateway_config

compliant_service_accounts := {
  "gateway-backend-sa@api_cfg.iam.gserviceaccount.com"
}

non_compliant_resources[res_name] if {
  resource := input.planned_values.root_module.resources[_]
  resource.type == "google_api_gateway_api_config"
  backend := resource.values.gateway_config[0].backend_config[0]
  not backend.google_service_account in compliant_service_accounts
  res_name := resource.name
}

summary := {
  "message": [
    sprintf("Total API Gateway Config detected: %v", [count(input.planned_values.root_module.resources)]),
    sprintf("Non-compliant API Gateway Config: %v/%v", [count(non_compliant_resources), count(input.planned_values.root_module.resources)])
  ]
}

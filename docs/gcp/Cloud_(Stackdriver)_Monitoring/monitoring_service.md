## 🛡️ Policy Deployment Engine: `monitoring_service`

This section provides a concise policy evaluation for the `monitoring_service` resource in GCP.

Reference: [Terraform Registry – monitoring_service](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/monitoring_service)

---

## 1. Argument Reference

### `service_id`
- Description: (Required) An optional service ID to use. If not given, the server will generate a service ID.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `display_name`
- Description: (Optional) Name used for UI elements listing this Service.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `user_labels`
- Description: (Optional) Labels which have been used to annotate the service. Label keys must start with a letter. Label keys and values may contain lowercase letters, numbers, underscores, and dashes. Label keys and values have a maximum length of 63 characters, and must be less than 128 bytes in size. Up to 64 label entries may be stored. For labels which do not have a semantic value, the empty string may be supplied for the label value.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `basic_service`
- Description: (Optional) A well-known service type, defined by its service type and service labels. Valid values of service types and services labels are described at https://cloud.google.com/stackdriver/docs/solutions/slo-monitoring/api/api-structures#basic-svc-w-basic-sli Structure is [documented below](#nested_basic_service).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_basic_service"></a>The `basic_service` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `service_type`
- Description: (Optional) The type of service that this basic service defines, e.g. APP_ENGINE service type
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `service_labels`
- Description: (Optional) Labels that specify the resource that emits the monitoring data which is used for SLO reporting of this `Service`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

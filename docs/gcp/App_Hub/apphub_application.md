## 🛡️ Policy Deployment Engine: `apphub_application`

This section provides a concise policy evaluation for the `apphub_application` resource in GCP.

Reference: [Terraform Registry – apphub_application](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/apphub_application)

---

## 1. Argument Reference

### `scope`
- Description: (Required) Scope of an application. Structure is [documented below](#nested_scope).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Required) Part of `parent`. See documentation of `projectsId`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `application_id`
- Description: (Required) Required. The Application identifier.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `display_name`
- Description: (Optional) Optional. User-defined name for the Application.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) Optional. User-defined description of an Application.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `attributes`
- Description: (Optional) Consumer provided attributes. Structure is [documented below](#nested_attributes).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_scope"></a>The `scope` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `type`
- Description: (Required) Required. Scope Type. Possible values: REGIONAL GLOBAL Possible values are: `REGIONAL`, `GLOBAL`. <a name="nested_attributes"></a>The `attributes` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `criticality`
- Description: (Optional) Criticality of the Application, Service, or Workload Structure is [documented below](#nested_attributes_criticality).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `environment`
- Description: (Optional) Environment of the Application, Service, or Workload Structure is [documented below](#nested_attributes_environment).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `developer_owners`
- Description: (Optional) Optional. Developer team that owns development and coding. Structure is [documented below](#nested_attributes_developer_owners).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `operator_owners`
- Description: (Optional) Optional. Operator team that ensures runtime and operations. Structure is [documented below](#nested_attributes_operator_owners).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `business_owners`
- Description: (Optional) Optional. Business team that ensures user needs are met and value is delivered Structure is [documented below](#nested_attributes_business_owners). <a name="nested_attributes_criticality"></a>The `criticality` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `type`
- Description: (Required) Criticality type. Possible values are: `MISSION_CRITICAL`, `HIGH`, `MEDIUM`, `LOW`. <a name="nested_attributes_environment"></a>The `environment` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `type`
- Description: (Required) Environment type. Possible values are: `PRODUCTION`, `STAGING`, `TEST`, `DEVELOPMENT`. <a name="nested_attributes_developer_owners"></a>The `developer_owners` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `display_name`
- Description: (Optional) Optional. Contact's name.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `email`
- Description: (Required) Required. Email address of the contacts. <a name="nested_attributes_operator_owners"></a>The `operator_owners` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `display_name`
- Description: (Optional) Optional. Contact's name.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `email`
- Description: (Required) Required. Email address of the contacts. <a name="nested_attributes_business_owners"></a>The `business_owners` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `display_name`
- Description: (Optional) Optional. Contact's name.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `email`
- Description: (Required) Required. Email address of the contacts.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

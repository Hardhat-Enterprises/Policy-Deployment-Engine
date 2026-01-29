## 🛡️ Policy Deployment Engine: `apphub_workload`

This section provides a concise policy evaluation for the `apphub_workload` resource in GCP.

Reference: [Terraform Registry – apphub_workload](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/apphub_workload)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `discovered_workload` | Immutable. The resource name of the original discovered workload. | true | false | None | None | None |
| `location` | Part of `parent`.  Full resource name of a parent Application. Example: projects/{HOST_PROJECT_ID}/locations/{LOCATION}/applications/{APPLICATION_ID} | true | false | None | None | None |
| `application_id` | Part of `parent`.  Full resource name of a parent Application. Example: projects/{HOST_PROJECT_ID}/locations/{LOCATION}/applications/{APPLICATION_ID} | true | false | None | None | None |
| `workload_id` | The Workload identifier. | true | false | None | None | None |
| `display_name` | User-defined name for the Workload. | false | false | None | None | None |
| `description` | User-defined description of a Workload. | false | false | None | None | None |
| `attributes` | Required. Consumer provided attributes. Structure is [documented below](#nested_attributes). | true | false | attributes has no impact on the security of the resource or data contained. | None | None |
| `project` | If it is not provided, the provider project is used. | false | false | None | None | None |
| `criticality` |  | false | false | None | None | None |
| `environment` |  | false | false | None | None | None |
| `developer_owners` |  | false | false | None | None | None |
| `operator_owners` |  | false | false | None | None | None |
| `business_owners` |  | false | false | None | None | None |

### attributes Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `criticality` | Criticality of the Application, Service, or Workload Structure is [documented below](#nested_attributes_criticality). | true | false | The policy whitelists criticality.type to a known set so risk/criticality reporting and downstream controls remain reliable. | ['MISSION_CRITICAL', 'HIGH', 'MEDIUM', 'LOW'] | None |
| `environment` | Environment of the Application, Service, or Workload Structure is [documented below](#nested_attributes_environment). | true | false | The policy whitelists environment.type to a known set to keep environment labels consistent for governance and reporting. | ['DEVELOPMENT', 'TEST', 'STAGING', 'PRODUCTION'] | None |
| `developer_owners` | Developer team that owns development and coding. Structure is [documented below](#nested_attributes_developer_owners). | false | false | None | None | None |
| `operator_owners` | Operator team that ensures runtime and operations. Structure is [documented below](#nested_attributes_operator_owners). | false | false | None | None | None |
| `business_owners` | Business team that ensures user needs are met and value is delivered Structure is [documented below](#nested_attributes_business_owners). | false | false | None | None | None |

### criticality Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `type` | Criticality type. Possible values are: `MISSION_CRITICAL`, `HIGH`, `MEDIUM`, `LOW`. | true | false | Must be one of: MISSION_CRITICAL, HIGH, MEDIUM, LOW (whitelist). | ['MISSION_CRITICAL', 'HIGH', 'MEDIUM', 'LOW'] | None |

### environment Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `type` | Environment type. Possible values are: `PRODUCTION`, `STAGING`, `TEST`, `DEVELOPMENT`. | true | false | Must be one of: DEVELOPMENT, TEST, STAGING, PRODUCTION (whitelist). | ['DEVELOPMENT', 'TEST', 'STAGING', 'PRODUCTION'] | None |

### developer_owners Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `display_name` | Contact's name. | false | false | None | None | None |
| `email` | Email address of the contacts. | true | false | None | None | None |

### operator_owners Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `display_name` | Contact's name. | false | false | None | None | None |
| `email` | Email address of the contacts. | true | false | None | None | None |

### business_owners Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `display_name` | Contact's name. | false | false | None | None | None |
| `email` | Email address of the contacts. | true | false | None | None | None |

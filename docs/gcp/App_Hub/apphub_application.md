## 🛡️ Policy Deployment Engine: `apphub_application`

This section provides a concise policy evaluation for the `apphub_application` resource in GCP.

Reference: [Terraform Registry – apphub_application](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/apphub_application)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `scope` | Scope of an application. Structure is [documented below](#nested_scope). | true | false | None | None | None |
| `location` | Part of `parent`. See documentation of `projectsId`. | true | false | None | None | None |
| `application_id` | Required. The Application identifier. | true | false | None | None | None |
| `display_name` | Optional. User-defined name for the Application. | false | false | None | None | None |
| `description` | Optional. User-defined description of an Application. | false | false | None | None | None |
| `attributes` | Required. Consumer provided attributes. Structure is [documented below](#nested_attributes). | true | false | attributes has no impact on the security of the resource or data contained. | None | None |
| `project` | If it is not provided, the provider project is used. | false | false | None | None | None |
| `criticality` |  | false | false | None | None | None |
| `environment` |  | false | false | None | None | None |
| `developer_owners` |  | false | false | None | None | None |
| `operator_owners` |  | false | false | None | None | None |
| `business_owners` |  | false | false | None | None | None |

### scope Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `type` | Required. Scope Type. Possible values: REGIONAL GLOBAL Possible values are: `REGIONAL`, `GLOBAL`. | true | true | This controls the application’s discovery/visibility boundary in App Hub. Restricting scope to REGIONAL reduces the blast radius of misclassification and helps keep governance aligned to a specific region rather than globally. | REGIONAL | GLOBAL |

### attributes Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `criticality` | Criticality of the Application, Service, or Workload Structure is [documented below](#nested_attributes_criticality). | true | false | The policy whitelists criticality.type to a known set so risk/criticality reporting and downstream controls remain reliable. | ['MISSION_CRITICAL', 'HIGH', 'MEDIUM', 'LOW'] | None |
| `environment` | Environment of the Application, Service, or Workload Structure is [documented below](#nested_attributes_environment). | true | false | The policy whitelists environment.type to a known set to keep environment labels consistent for governance and reporting. | ['DEVELOPMENT', 'TEST', 'STAGING', 'PRODUCTION'] | None |
| `developer_owners` | Optional. Developer team that owns development and coding. Structure is [documented below](#nested_attributes_developer_owners). | false | false | None | None | None |
| `operator_owners` | Optional. Operator team that ensures runtime and operations. Structure is [documented below](#nested_attributes_operator_owners). | false | false | None | None | None |
| `business_owners` | Optional. Business team that ensures user needs are met and value is delivered Structure is [documented below](#nested_attributes_business_owners). | false | false | None | None | None |

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
| `display_name` | Optional. Contact's name. | false | false | None | None | None |
| `email` | Required. Email address of the contacts. | true | false | None | None | None |

### operator_owners Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `display_name` | Optional. Contact's name. | false | false | None | None | None |
| `email` | Required. Email address of the contacts. | true | false | None | None | None |

### business_owners Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `display_name` | Optional. Contact's name. | false | false | None | None | None |
| `email` | Required. Email address of the contacts. | true | false | None | None | None |

## 🛡️ Policy Deployment Engine: `apphub_service`

This section provides a concise policy evaluation for the `apphub_service` resource in GCP.

Reference: [Terraform Registry – apphub_service](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/apphub_service)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `discovered_service` | Immutable. The resource name of the original discovered service. | true | None | None |
| `location` | Part of `parent`.  Full resource name of a parent Application. Example: projects/{HOST_PROJECT_ID}/locations/{LOCATION}/applications/{APPLICATION_ID} | true | None | None |
| `application_id` | Part of `parent`.  Full resource name of a parent Application. Example: projects/{HOST_PROJECT_ID}/locations/{LOCATION}/applications/{APPLICATION_ID} | true | None | None |
| `service_id` | The Service identifier. | true | None | None |
| `display_name` | User-defined name for the Service. | false | None | None |
| `description` | User-defined description of a Service. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### attributes Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `criticality` | Criticality of the Application, Service, or Workload Structure is [documented below](#nested_attributes_criticality). | false | None | None |
| `environment` | Environment of the Application, Service, or Workload Structure is [documented below](#nested_attributes_environment). | false | None | None |
| `developer_owners` | Developer team that owns development and coding. Structure is [documented below](#nested_attributes_developer_owners). | false | None | None |
| `operator_owners` | Operator team that ensures runtime and operations. Structure is [documented below](#nested_attributes_operator_owners). | false | None | None |
| `business_owners` | Business team that ensures user needs are met and value is delivered Structure is [documented below](#nested_attributes_business_owners). | false | None | None |

### criticality Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `type` | Criticality type. Possible values are: `MISSION_CRITICAL`, `HIGH`, `MEDIUM`, `LOW`. | true | None | None |

### environment Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `type` | Environment type. Possible values are: `PRODUCTION`, `STAGING`, `TEST`, `DEVELOPMENT`. | true | None | None |

### developer_owners Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `display_name` | Contact's name. | false | None | None |
| `email` | Required. Email address of the contacts. | true | None | None |

### operator_owners Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `display_name` | Contact's name. | false | None | None |
| `email` | Required. Email address of the contacts. | true | None | None |

### business_owners Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `display_name` | Contact's name. | false | None | None |
| `email` | Required. Email address of the contacts. | true | None | None |

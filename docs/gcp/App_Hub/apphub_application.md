## 🛡️ Policy Deployment Engine: `apphub_application`

This section provides a concise policy evaluation for the `apphub_application` resource in GCP.

Reference: [Terraform Registry – apphub_application](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/apphub_application)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `location` | Part of `parent`. See documentation of `projectsId`. | true | None | None |
| `application_id` | Required. The Application identifier. | true | None | None |
| `display_name` | Optional. User-defined name for the Application. | false | None | None |
| `description` | Optional. User-defined description of an Application. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### scope Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `type` | Required. Scope Type. Possible values: REGIONAL GLOBAL Possible values are: `REGIONAL`, `GLOBAL`. | true | None | None |

### attributes Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `criticality` | Criticality of the Application, Service, or Workload Structure is [documented below](#nested_attributes_criticality). | false | None | None |
| `environment` | Environment of the Application, Service, or Workload Structure is [documented below](#nested_attributes_environment). | false | None | None |
| `developer_owners` | Optional. Developer team that owns development and coding. Structure is [documented below](#nested_attributes_developer_owners). | false | None | None |
| `operator_owners` | Optional. Operator team that ensures runtime and operations. Structure is [documented below](#nested_attributes_operator_owners). | false | None | None |
| `business_owners` | Optional. Business team that ensures user needs are met and value is delivered Structure is [documented below](#nested_attributes_business_owners). | false | None | None |

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
| `display_name` | Optional. Contact's name. | false | None | None |
| `email` | Required. Email address of the contacts. | true | None | None |

### operator_owners Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `display_name` | Optional. Contact's name. | false | None | None |
| `email` | Required. Email address of the contacts. | true | None | None |

### business_owners Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `display_name` | Optional. Contact's name. | false | None | None |
| `email` | Required. Email address of the contacts. | true | None | None |

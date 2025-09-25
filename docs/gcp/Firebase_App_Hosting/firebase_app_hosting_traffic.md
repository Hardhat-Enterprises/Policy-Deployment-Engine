## 🛡️ Policy Deployment Engine: `firebase_app_hosting_traffic`

This section provides a concise policy evaluation for the `firebase_app_hosting_traffic` resource in GCP.

Reference: [Terraform Registry – firebase_app_hosting_traffic](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/firebase_app_hosting_traffic)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `location` | The location the Backend that this Traffic config applies to | true | false | Location inherits from backend configuration and has no independent security policy. | australia-southeast2-a | us-east1 |
| `backend` | Id of the backend that this Traffic config applies to | true | false | Backend ID is a reference with no direct security implications. | c | nc |
| `target` | Set to manually control the desired traffic for the backend. This will cause current to eventually match this value. The percentages must add up to 100. Structure is [documented below](#nested_target). | false | false | Manual traffic targeting has no specific security policy. | None | None |
| `rollout_policy` | The policy for how builds and rollouts are triggered and rolled out. Structure is [documented below](#nested_rollout_policy). | false | true | Rollout policy must specify approved source branches to ensure only production-ready code is deployed. | Refer to child arguments | Refer to child arguments |
| `project` | If it is not provided, the provider project is used. | false | false | Project specification uses default provider project when not specified. | None | None |
| `splits` |  | false | false | Traffic splits configuration has no specific security policy. | None | None |

### target Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `splits` | A list of traffic splits that together represent where traffic is being routed. Structure is [documented below](#nested_target_splits). | true | false | Traffic splits configuration has no specific security policy. | None | None |

### rollout_policy Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `disabled` | A flag that, if true, prevents rollouts from being created via this RolloutPolicy. | false | false | Rollout enable/disable flag has no specific security policy. | None | None |
| `disabled_time` | (Output) If disabled is set, the time at which the rollouts were disabled. | false | false | Output field with no security policy. | None | None |
| `codebase_branch` | Specifies a branch that triggers a new build to be started with this policy. If not set, no automatic rollouts will happen. | false | true | Codebase branch must be set to 'main' to ensure only stable, production-ready code triggers automatic deployments. | main | dev |

### splits Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `build` | The build that traffic is being routed to. | true | false | Build reference has no specific security policy. | None | None |
| `percent` | The percentage of traffic to send to the build. Currently must be 100 or 0. | true | false | Traffic percentage has no specific security policy. | None | None |

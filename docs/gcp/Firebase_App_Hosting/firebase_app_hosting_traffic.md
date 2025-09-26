## 🛡️ Policy Deployment Engine: `firebase_app_hosting_traffic`

This section provides a concise policy evaluation for the `firebase_app_hosting_traffic` resource in GCP.

Reference: [Terraform Registry – firebase_app_hosting_traffic](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/firebase_app_hosting_traffic)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `location` | The location the Backend that this Traffic config applies to | true | false | None | None | None |
| `backend` | Id of the backend that this Traffic config applies to | true | false | None | None | None |
| `target` | Set to manually control the desired traffic for the backend. This will cause current to eventually match this value. The percentages must add up to 100. Structure is [documented below](#nested_target). | false | false | None | None | None |
| `rollout_policy` | The policy for how builds and rollouts are triggered and rolled out. Structure is [documented below](#nested_rollout_policy). | false | false | None | None | None |
| `project` | If it is not provided, the provider project is used. | false | false | None | None | None |
| `splits` |  | false | false | None | None | None |

### target Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `splits` | A list of traffic splits that together represent where traffic is being routed. Structure is [documented below](#nested_target_splits). | true | false | None | None | None |

### rollout_policy Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `disabled` | A flag that, if true, prevents rollouts from being created via this RolloutPolicy. | false | false | None | None | None |
| `disabled_time` | (Output) If disabled is set, the time at which the rollouts were disabled. | false | false | None | None | None |
| `codebase_branch` | Specifies a branch that triggers a new build to be started with this policy. If not set, no automatic rollouts will happen. | false | false | None | None | None |

### splits Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `build` | The build that traffic is being routed to. | true | false | None | None | None |
| `percent` | The percentage of traffic to send to the build. Currently must be 100 or 0. | true | false | None | None | None |

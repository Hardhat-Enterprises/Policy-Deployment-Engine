## 🛡️ Policy Deployment Engine: `firebase_app_hosting_traffic`

This section provides a concise policy evaluation for the `firebase_app_hosting_traffic` resource in GCP.

Reference: [Terraform Registry – firebase_app_hosting_traffic](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/firebase_app_hosting_traffic)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `location` | The location the Backend that this Traffic config applies to | true | None | None |
| `backend` | Id of the backend that this Traffic config applies to | true | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### target Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `splits` | A list of traffic splits that together represent where traffic is being routed. Structure is [documented below](#nested_target_splits). | true | None | None |

### rollout_policy Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `disabled` | A flag that, if true, prevents rollouts from being created via this RolloutPolicy. | false | None | None |
| `disabled_time` | (Output) If disabled is set, the time at which the rollouts were disabled. | none | None | None |
| `codebase_branch` | Specifies a branch that triggers a new build to be started with this policy. If not set, no automatic rollouts will happen. | false | None | None |

### splits Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `build` | The build that traffic is being routed to. | true | None | None |
| `percent` | The percentage of traffic to send to the build. Currently must be 100 or 0. | true | None | None |

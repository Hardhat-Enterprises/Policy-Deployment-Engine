## 🛡️ Policy Deployment Engine: `google_workload_identity_service_agent`

This section provides a concise policy evaluation for the `google_workload_identity_service_agent` resource in GCP.

Reference: [Terraform Registry – google_workload_identity_service_agent](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_workload_identity_service_agent)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `parent` | The parent resource path. | true | false | Purpose is to retreive service information from other google service agents thus access control is controlled outside of the resource resulting in not having an effect on security | None | None |

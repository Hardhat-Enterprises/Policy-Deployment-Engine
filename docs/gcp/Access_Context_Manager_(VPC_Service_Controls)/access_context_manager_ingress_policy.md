## 🛡️ Policy Deployment Engine: `access_context_manager_ingress_policy`

This section provides a concise policy evaluation for the `access_context_manager_ingress_policy` resource in GCP.

Reference: [Terraform Registry – access_context_manager_ingress_policy](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/access_context_manager_ingress_policy)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `resource` | A GCP resource that is inside of the service perimeter. | true | true | Restricts ingress project resources to those on the approved list. | ['projects/123456789'] | ['projects/999999999'] |
| `ingress_policy_name` | The name of the Service Perimeter to add this resource to. | true | true | Confirms the policy maps to the correct authorized service perimeter. | ['accessPolicies/123456/servicePerimeters/my_perimeter'] | ['accessPolicies/123456/servicePerimeters/WRONG_PERIMETER'] |

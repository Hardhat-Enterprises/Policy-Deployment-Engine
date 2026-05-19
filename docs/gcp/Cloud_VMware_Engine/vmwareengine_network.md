## 🛡️ Policy Deployment Engine: `vmwareengine_network`

This section provides a concise policy evaluation for the `vmwareengine_network` resource in GCP.

Reference: [Terraform Registry – vmwareengine_network](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/vmwareengine_network)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `type` | VMware Engine network type. Possible values are: `LEGACY`, `STANDARD`. | true | true | The network type determines the VMware Engine network mode. STANDARD should be used instead of LEGACY because legacy network types may not align with current security and operational standards. | STANDARD | LEGACY |
| `location` | The location where the VMwareEngineNetwork should reside. | true | true | The location determines where the VMware Engine network is created. Approved regions help meet organisational, compliance, and data governance requirements. | australia-southeast2 | us-west1 |
| `name` | The ID of the VMwareEngineNetwork. | true | true | Network names should follow an approved naming standard so that resources can be clearly identified, audited, and managed consistently. | c | nc |
| `description` | User-provided description for this VMware Engine network. | false | false | The description is used for documentation and does not directly change the security behaviour of the network. | None | None |
| `project` | If it is not provided, the provider project is used. | false | true | The project determines where the VMware Engine network is created. Using an approved project helps keep the network within the correct governance, access control, and billing boundary. | project-d7f19645-ccba-48ef-bce | unapproved-project |

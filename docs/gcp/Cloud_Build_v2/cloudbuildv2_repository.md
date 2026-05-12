## 🛡️ Policy Deployment Engine: `cloudbuildv2_repository`

This section provides a concise policy evaluation for the `cloudbuildv2_repository` resource in GCP.

Reference: [Terraform Registry – cloudbuildv2_repository](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloudbuildv2_repository)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `name` | Name of the repository. | true | false | The repository name itself does not directly impact security. However, enforcing naming conventions can help with resource identification, organisation, and management. | None | None |
| `remote_uri` | Required. Git Clone HTTPS URI. | true | true | Restricting the remote URI ensures that only trusted and secure repositories are connected. Enforcing HTTPS prevents insecure data transmission, and limiting repositories to approved domains reduces the risk of integrating malicious or unverified source code. | https://github.com/approved-org/secure-repo.git | http://github.com/random-user/unknown-repo.git |
| `parent_connection` | The connection for the resource | true | true | Restricting the parent connection ensures that repositories are linked only to approved and trusted connections. This prevents unauthorized integrations with external systems and reduces the risk of exposing source code or credentials to untrusted services. | secure-connection | unknown-connection |
| `annotations` | Allows clients to store small amounts of arbitrary data. **Note**: This field is non-authoritative, and will only manage the annotations present in your configuration. Please refer to the field `effective_annotations` for all of the annotations present on the resource. | false | true | Annotations help enforce governance and security practices by ensuring that resources are properly labelled with environment and data classification. Data classification is critical for identifying sensitive data and applying appropriate security controls, while environment tagging helps manage deployment contexts and reduce operational risks. | annotations = { environment = "prod", data_classification = "confidential" } | annotations = { environment = "unknown", data_classification = "unknown" } |
| `location` | The location for the resource | false | true | Restricting the location ensures data residency, compliance with regional regulations, and reduces exposure to unauthorized jurisdictions. Enforcing approved regions (such as Australia) helps meet organisational and legal security requirements. | australia-southeast2 | us-central1 |
| `project` | If it is not provided, the provider project is used. | false | true | Restricting the project ensures resources are created only within approved and governed environments. This prevents accidental deployment to unauthorized projects and enforces access control, billing boundaries, and organisational security policies. | approved-project | unknown-project |

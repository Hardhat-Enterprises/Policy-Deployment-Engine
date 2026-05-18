## 🛡️ Policy Deployment Engine: `certificate_manager_dns_authorization`

This section provides a concise policy evaluation for the `certificate_manager_dns_authorization` resource in GCP.

Reference: [Terraform Registry – certificate_manager_dns_authorization](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/certificate_manager_dns_authorization)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `domain` | A domain which is being authorized. A DnsAuthorization resource covers a single domain and its wildcard, e.g. authorization for "example.com" can be used to issue certificates for "example.com" and "*.example.com". | true | true | The domain controls which domain can be validated for certificate issuance. | Use an approved domain. | Using a domain outside the approved organisation domain list. |
| `name` | Name of the resource; provided by the client when the resource is created. The name must be 1-64 characters long, and match the regular expression [a-zA-Z][a-zA-Z0-9_-]* which means the first character must be a letter, and all following characters must be a dash, underscore, letter or digit. | true | false | None | None | None |
| `description` | A human-readable description of the resource. | false | false | None | None | None |
| `labels` | Set of label tags associated with the DNS Authorization resource. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | false | None | None | None |
| `type` | type of DNS authorization. If unset during the resource creation, FIXED_RECORD will be used for global resources, and PER_PROJECT_RECORD will be used for other locations. FIXED_RECORD DNS authorization uses DNS-01 validation method PER_PROJECT_RECORD DNS authorization allows for independent management of Google-managed certificates with DNS authorization across multiple projects. Possible values are: `FIXED_RECORD`, `PER_PROJECT_RECORD`. | false | true | PER_PROJECT_RECORD supports independent management of DNS authorization across projects, which helps keep certificate validation separated by project. | Use PER_PROJECT_RECORD for project-separated DNS authorization. | Using FIXED_RECORD where project-separated DNS authorization is expected. |
| `location` | The Certificate Manager location. If not specified, "global" is used. | false | false | None | None | None |
| `project` | If it is not provided, the provider project is used. | false | false | None | None | None |

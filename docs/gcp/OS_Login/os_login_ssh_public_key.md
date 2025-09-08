## 🛡️ Policy Deployment Engine: `os_login_ssh_public_key`

This section provides a concise policy evaluation for the `os_login_ssh_public_key` resource in GCP.

Reference: [Terraform Registry – os_login_ssh_public_key](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/os_login_ssh_public_key)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `key` | Public key text in SSH format, defined by RFC4253 section 6.6. | true | None | None |
| `user` | The user email. | true | None | None |
| `expiration_time_usec` | An expiration time in microseconds since epoch. | false | None | None |
| `project` | The project ID of the Google Cloud Platform project. | false | None | None |

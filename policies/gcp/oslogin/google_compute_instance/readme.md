# OS Login Security Policies for GCP Compute Engine

This folder contains 5 security policies for enforcing OS Login best practices on Google Compute Engine instances.  
Each policy is written in Rego, follows the PDE template, and has been tested with compliant (`c.tf`) and non-compliant (`nc.tf`) Terraform resources.

## Policies Implemented

1. **enabled**  
   - Ensures `metadata.enable-oslogin = TRUE`.  
   - Remedy: Set `enable-oslogin` metadata key to `TRUE`.

2. **block_project_ssh_keys**  
   - Ensures project-wide SSH keys are blocked when OS Login is enabled.  
   - Remedy: Set `metadata.block-project-ssh-keys = TRUE`.

3. **require_service_account**  
   - Ensures every instance with OS Login has a service account attached.  
   - Remedy: Attach a valid `service_account` block.

4. **restrict_service_account_scopes**  
   - Disallows overly broad OAuth scopes (e.g., `cloud-platform`).  
   - Remedy: Use minimal scopes such as `logging.write` or `monitoring.write`.

5. **twofa**  
   - Ensures OS Login two-factor authentication (`metadata.enable-oslogin-2fa`) is enabled.  
   - Remedy: Set `enable-oslogin-2fa = TRUE`.

---

## Testing
- Created both compliant (`c.tf`) and non-compliant (`nc.tf`) resources.  
- Generated plan JSONs with Terraform and validated using OPA:  

```bash
opa eval --data ./policies/gcp --input ./inputs/gcp/oslogin/google_compute_instance/<policy>/plan.json "data.terraform.gcp.security.oslogin.google_compute_instance.<policy>.message" --format pretty

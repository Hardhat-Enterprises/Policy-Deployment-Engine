<a id="top"></a>
## 🚀 General Workflow

### ✅ Example Workflow

1. Get assigned a service from PDE Leadership (e.g. `Cloud Functions`).  
2. Research the service and identify security-relevant arguments.  

3. Create the required folder structure. Everything for one attribute lives in **one**
   folder:
   - `policies/gcp/<Service>/<resource>/<attribute>/` — one folder **per attribute**,
     holding `policy.rego`, `compliant.tf` and `nonCompliant.tf`
   - `policies/gcp/<Service>/<resource>/_vars.rego` — a single file for the whole
     resource, sitting beside the attribute folders

   `<Service>` is the docs-taxonomy folder name (e.g. `Cloud Functions`, with spaces);
   `<resource>` and `<attribute>` are the exact Terraform resource type and argument names.

4. Create and configure the fixtures (copy them from `templates/gcp`):
   - `compliant.tf` (compliant example)  
   - `nonCompliant.tf` (non-compliant example)  

   You do **not** create a `config.tf`. There is one shared provider stub at
   `policies/gcp/config.tf`, and the test harness copies it in when it runs Terraform.

5. (Optional, to discover the attribute path) Generate a Terraform plan and inspect it:

    terraform init  
    terraform plan --out=plan  
    terraform show -json plan > plan.json  

   You don't commit this `plan.json` — the test harness generates and caches plans for you
   under `plan_cache/`. (To plan by hand you need a `config.tf` in the directory; copy
   `policies/gcp/config.tf` in temporarily and delete it before you commit.)

6. Use the plan JSON to determine your attribute path.  

7. Write your:
   - `<attribute>/policy.rego` (policy logic)  
   - `_vars.rego` (resource metadata — one per resource)  

8. Test your policy. The linter runs automatically via pre-commit, or run it directly:

    python3 scripts/linters/linter.py --platform gcp

   Then run the OPA test harness (it handles `terraform plan`, plan caching, and `opa eval`):

    python3 scripts/auto_test/auto_test.py "gcp/<Service>/<resource>"

9. Fix any errors and re-test until successful.  

10. Complete documentation in the resource's JSON at `docs/gcp/<Service>/<resource>.json`
   (one file per resource). Generate/refresh the JSON skeleton from the provider schema with:

    python3 scripts/docgen/generator.py --csp gcp --mode refresh-existing --service "<Service>"

   then fill in `security_impact` and `rationale` for each argument.

11. Commit and push your changes:

    git add .  
    git commit -m "your message"  
    git push origin <branch-name>  

12. Create a pull request and wait for review.

---

### ⚠️ Notes & Best Practices

- Follow naming conventions exactly (must match Terraform)  
- Each policy targets **one argument only**  
- Ensure all required Terraform arguments are included  
- Attribute paths must match the structure of `plan.json`  
- Always test before pushing  
- Documentation must be completed before raising a PR  


<div align="center">

[📘 Back to Contents](policy-writing-tutorial.md#top) &nbsp;&nbsp;&nbsp;  &nbsp;&nbsp;&nbsp;

</div>


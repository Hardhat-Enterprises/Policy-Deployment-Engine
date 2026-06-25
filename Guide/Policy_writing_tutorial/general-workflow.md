<a id="top"></a>
## 🚀 General Workflow

### ✅ Example Workflow

1. Get assigned a service from PDE Leadership (e.g. `cloud_functions`).  
2. Research the service and identify security-relevant arguments.  

3. Create the required folder structure in:
   - `inputs/gcp/<service>/<resource>/<policy>`
   - `policies/gcp/<service>/<resource>/<policy>`

4. Create and configure:
   - `c.tf` (compliant example)  
   - `nc.tf` (non-compliant example)  
   - `config.tf`  

5. Run Terraform to generate a plan:

    terraform init  
    terraform plan --out=plan  
    terraform show -json plan > plan.json  

6. Use `plan.json` to determine your attribute path.  

7. Write your:
   - `policy.rego` (policy logic)  
   - `vars.rego` (resource metadata)  

8. Test your policy:

    python linter.py --gcp `<your service>`

    opa eval --data .\policies\gcp --data .\policies\_helpers --input .\inputs\gcp\<SERVICE>\<RESOURCE>\<ATTRIBUTE>\plan.json "data.terraform.gcp.security.<SERVICE>.<RESOURCE>.<ATTRIBUTE>.message" --format pretty

    opa eval --data .\policies\gcp --data .\policies\_helpers --input .\inputs\gcp\<SERVICE>\<RESOURCE>\<ATTRIBUTE>\plan.json "data.terraform.gcp.security.<SERVICE>.<RESOURCE>.<ATTRIBUTE>.details" --format pretty

9. Fix any errors and re-test until successful.  

10. Complete documentation:
   - Update `.json` files in `docs/gcp/<service>/resource_json/`  

11. Generate Markdown documentation:

    python3 scripts/docgen/create_markdown.py `<service>`

12. Review generated `.md` files in `docs/gcp/<service>/`.  

13. Commit and push your changes:

    git add .  
    git commit -m "your message"  
    git push origin `<branch-name>`  

14. Create a pull request and wait for review.

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


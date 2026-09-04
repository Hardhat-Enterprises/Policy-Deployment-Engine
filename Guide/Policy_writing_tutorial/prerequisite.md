<a id="top"></a>
<h1 align="center">Prerequisites</h1>


### 1. Upskilling guide

1. [Cloud – Introduction (GCP)](https://deakin365.sharepoint.com/:w:/r/sites/HardhatEnterprises2/_layouts/15/Doc.aspx?sourcedoc=%7B45C273BF-6345-4A79-87D8-58FC45C6ACD0%7D&file=Upskilling%20Guide.docx&action=default&mobileredirect=true&wdLOR=cDC1B5329-0505-49D3-8D33-F8129B9764AE)
2. [Terraform Introduction](https://deakin365.sharepoint.com/:w:/r/sites/HardhatEnterprises2/_layouts/15/Doc.aspx?sourcedoc=%7B45C273BF-6345-4A79-87D8-58FC45C6ACD0%7D&file=Upskilling%20Guide.docx&action=default&mobileredirect=true&wdLOR=c03767268-8844-48D5-8CED-7369E84A2858)
3. [Open Policy Agent (OPA, Rego)](https://deakin365.sharepoint.com/:w:/r/sites/HardhatEnterprises2/_layouts/15/Doc.aspx?sourcedoc=%7B45C273BF-6345-4A79-87D8-58FC45C6ACD0%7D&file=Upskilling%20Guide.docx&action=default&mobileredirect=true&wdLOR=c6690F993-C298-4BA3-AAC4-0166CDEBCC23)
4. [Policy Deployment Engine (PDE) Guides](https://deakin365.sharepoint.com/:w:/r/sites/HardhatEnterprises2/_layouts/15/Doc.aspx?sourcedoc=%7B45C273BF-6345-4A79-87D8-58FC45C6ACD0%7D&file=Upskilling%20Guide.docx&action=default&mobileredirect=true&wdLOR=c419E4129-B4A1-4C66-B30F-C569C32426DC)
5. [Git](https://deakin365.sharepoint.com/:w:/r/sites/HardhatEnterprises2/_layouts/15/Doc.aspx?sourcedoc=%7B45C273BF-6345-4A79-87D8-58FC45C6ACD0%7D&file=Upskilling%20Guide.docx&action=default&mobileredirect=true&wdLOR=c878001D8-0AFB-4779-8381-2B0C77998413)



### 2. Passed the contributors Quiz

To be able to contribute to Policy Development Engine and begin writing policies, a score of **90%** is required on the contributor’s quiz.

The quiz can be accessed here:  
[Contributor's Quiz – Policy Deployment Engine](https://forms.office.com/pages/responsepage.aspx?id=7Hgj0IgW1UaFQBwotfRw9qiIG310OQ9Juta4hpy5t41UMThPREw2UVdUU0Y3NkYxMVIzRUIxMU5LVC4u&route=shorturl)


### 3. Installed all necessary requirements

1. [GCP Register and CLI install – Windows](https://deakin365.sharepoint.com/sites/HardhatEnterprises2/_layouts/15/stream.aspx?id=%2Fsites%2FHardhatEnterprises2%2FShared%20Documents%2F%F0%9F%95%B9%20Policy%20Deployment%20Engine%2FT3%202025%2FInstructional%20Demos%2FRequirement%20Installations%2FGCP%20Register%20and%20CLI%20Install%20-%20Windows%2Emp4&referrer=StreamWebApp%2EWeb&referrerScenario=AddressBarCopied%2Eview%2Ecd64dda8-3376-42aa-a7b7-54669e5fee69)
2. [OPA Install Guide – Windows](https://deakin365.sharepoint.com/sites/HardhatEnterprises2/_layouts/15/stream.aspx?id=%2Fsites%2FHardhatEnterprises2%2FShared%20Documents%2F%F0%9F%95%B9%20Policy%20Deployment%20Engine%2FT3%202025%2FInstructional%20Demos%2FRequirement%20Installations%2FOPA%20Install%20Guide%20%2D%20Windows%2Emp4&referrer=StreamWebApp%2EWeb&referrerScenario=AddressBarCopied%2Eview%2Eaeb918e3%2Dbda4%2D4cf4%2Da780%2Dc42a3d164662)
3. [Terraform Install – Windows](https://deakin365.sharepoint.com/sites/HardhatEnterprises2/_layouts/15/stream.aspx?id=%2Fsites%2FHardhatEnterprises2%2FShared%20Documents%2F%F0%9F%95%B9%20Policy%20Deployment%20Engine%2FT3%202025%2FInstructional%20Demos%2FRequirement%20Installations%2FTerraform%20Install%20Windows%2Emp4&referrer=StreamWebApp%2EWeb&referrerScenario=AddressBarCopied%2Eview%2Efeacb275%2D9cb3%2D429e%2D9fb8%2D92b38bb0b0a0)


### 4. Joined the HardHat-Enterprises GitHub Repository

Ensure you have access to the repository and can create and push branches.

#### Install Pre-commit 

```
pip install pre-commit
```
#### Pull and merge the latest 'dev' branch into your branch
```
git fetch origin dev
git merge origin/dev
```
#### From the root of the repo, run: Shell

```
pre-commit install
```

Every commit then checks your branch name, your branch scope and the linters, and — when the
commit actually touches your resource — your documentation, your argument coverage and the OPA
test. It stays out of your way otherwise: a commit that changes nothing under your resource skips
the resource checks entirely, a docs-only commit skips the OPA test, and a fixture you just
edited skips it too rather than making a git hook run `terraform`.

That last case is the one to remember. Before you push, run the full check yourself:

```
python3 scripts/check_resource.py
```

That is the same set of checks CI runs. See
[Testing your policies](testing-policies.md#top).

#### Create your working branch

Branch names must follow the repo convention (enforced by the branch-name check
and the per-resource CI gate). Use one of:

- `Service/<platform>/<service_slug>/<resource_type>` — when working on a specific resource
- `feature/<name>` — for a general feature or any non-resource maintenance/cleanup work

The `<service_slug>` is the underscore slug of a `docs/<platform>` service folder
(folder names contain spaces/parens, which are illegal in git branch names) — e.g.
`Cloud Run (v2 API)` → `cloud_run_v2_api`. The `<resource_type>` is the exact
Terraform resource type.

```
git checkout -b Service/gcp/<service_slug>/<resource_type>
# e.g. git checkout -b Service/gcp/cloud_functions/google_cloudfunctions_function
```

#### Push your branch

```
git push origin Service/gcp/<service_slug>/<resource_type>
```

If the push is successful, you have the correct permissions and can continue your work on this branch.

#### If the push fails

- You may not have write access to the repository  
- Ensure you have accepted the repository invitation  
- Contact a team lead or repository administrator  


---

<div align="center">

[⬅️ Previous: Contents](policy-writing-tutorial.md#top) &nbsp;&nbsp;&nbsp; | &nbsp;&nbsp;&nbsp;
[📘 Back to Contents](policy-writing-tutorial.md#top) &nbsp;&nbsp;&nbsp; | &nbsp;&nbsp;&nbsp;
[Next: Researching and Documentation ➡️](researching-and-documentation.md#top)

</div>


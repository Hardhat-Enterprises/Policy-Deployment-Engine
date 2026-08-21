<a id="top"></a>
<h1 align="center">Terraform inputs</h1>

> You generate a plan here mainly to **inspect it and find your attribute path**. You do
> **not** commit `plan.json` — when you run the test harness (`auto_test.py`), it produces and
> caches the plan for you under `plan_cache/`.

### 1. terraform init

Make sure you are in the attribute directory you are writing your policy on:

`policies/gcp/<Service>/<resource>/<attribute>/`

Running `terraform` by hand there needs a provider block, which is no longer kept per
attribute. Copy `policies/gcp/config.tf` in temporarily, and delete it (along with
`plan`, `plan.json` and `.terraform/`) before you commit.


    terraform init

![Terraform-init](images/terraform-init.png)


### 2. get binary plan

    terraform plan --out=plan

![get-binary-plan](images/terraform-plan--out.PNG)


### 3. turn plan into .json file

    terraform show -json plan > plan.json

![turn-plan-into-.json](images/plan-json.PNG)



<div align="center">

if you are having trouble with this section please visit [Common Errors](common-errors.md)

</div>

<div align="center">

[⬅️ Previous: compliant.tf and nonCompliant.tf](c-tf-and-nc-tf.md#top) &nbsp;&nbsp;&nbsp; | &nbsp;&nbsp;&nbsp;
[📘 Back to Contents](policy-writing-tutorial.md#top) &nbsp;&nbsp;&nbsp; | &nbsp;&nbsp;&nbsp;
[Next: _vars.rego ➡️](vars-rego.md#top) 
</div>
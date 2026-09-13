<a id="top"></a>
<h1 align="center">Terraform inputs</h1>

> You generate a plan here mainly to **inspect it and find your attribute path**. You do
> **not** commit the `plan` / `plan.json` you make by hand below — they are gitignored. The
> test harness (`auto_test.py`) writes the plan that *is* committed: a `<sha>.json` in this
> same directory, named for the hash of your `*.tf`. Commit that one, and nothing else.

### 1. terraform init

Make sure you are in the inputs directory of the attribute you are writing your policy on:

`inputs/gcp/<Service>/<resource>/<attribute>/`


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
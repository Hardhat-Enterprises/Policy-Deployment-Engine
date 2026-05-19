<a id="top"></a>
<h1 align="center">Terraform inputs</h1>


### 1. terraform init

Make sure you are in the inputs directory of the attribute you are writing your policy on:

`inputs/gcp/service_name/resource/argument reference(policy)`


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

[⬅️ Previous: c.tf and nc.tf](c-tf-and-nc-tf.md#top) &nbsp;&nbsp;&nbsp; | &nbsp;&nbsp;&nbsp;
[📘 Back to Contents](policy-writing-tutorial.md#top) &nbsp;&nbsp;&nbsp; | &nbsp;&nbsp;&nbsp;
[Next: vars.rego ➡️](vars-rego.md#top) 
</div>
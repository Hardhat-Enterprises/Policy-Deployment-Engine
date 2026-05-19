<a id="top"></a>
<h1 align="center">Testing your policies</h1>

### 1. Run the `linter` script

Run the `linter.py` script to catch any syntax errors in your policies.

    python linter.py --gcp <your-service-name>

![linters-output](images/linters-output.PNG)

### 2. Run the local policy scan
```

python .\scripts\local_policy_scan.py gcp/<SERVICE>/<RESOURCE TYPE> --resource <RESOURCE TYPE> --policy <ATTRIBUTE>

```

<div align="center">

[⬅️ Previous: policy.rego](policy-rego.md#top) &nbsp;&nbsp;&nbsp; | &nbsp;&nbsp;&nbsp;
[📘 Back to Contents](policy-writing-tutorial.md#top) &nbsp;&nbsp;&nbsp; | &nbsp;&nbsp;&nbsp;
[Next: Raising a pull request ➡️](raising-pull-request.md#top) 

</div>



PDE Policy Mutation Testing Framework

1. Overview

This tool tests how well PDE Rego policies detect insecure Terraform configurations.

The framework starts with a known compliant Terraform plan. It then creates controlled insecure values based on the policy rules. The changed plan is evaluated with the real PDE OPA policy.

If the policy detects the new insecure configuration, the mutation is marked as KILLED.

If the policy does not detect it, the mutation is marked as SURVIVED.

This helps show whether a policy can detect unsafe changes instead of only passing its normal test fixtures.

2. Why this tool was created

Normal policy testing checks known compliant and non compliant examples.

Mutation testing adds another level of testing. It creates new insecure values from a compliant plan and checks whether the policy can detect them.

This can help find weak policy logic, missing checks, and cases where a policy may allow an unsafe configuration.

3. Main workflow

The framework follows this process.

Load the committed Terraform plan fixture.

Find the compliant example resource.

Read the policy metadata from the Rego conditions.

Generate an insecure value using the policy type and policy values.

Update only the selected attribute in a copied Terraform plan.

Evaluate the changed plan using the real PDE OPA policy.

Compare the new policy failures with the original failures.

Mark the mutation as KILLED, SURVIVED, or SKIPPED.

Calculate the mutation score.

4. Result meanings

KILLED

The policy detected the generated insecure configuration.

This means the mutation was successfully caught by the policy.

SURVIVED

The policy did not detect the generated insecure configuration.

This may show a policy gap that should be reviewed.

SKIPPED

The framework could not safely generate or apply a mutation for that condition.

Skipped mutations are not included in the mutation score.

UNSUPPORTED

The policy does not expose the standard PDE mutation metadata through conditions.

Some custom Rego policies use their own logic instead of the standard PDE helper structure. These policies are reported clearly as unsupported instead of guessing how they should be mutated.

5. Supported policy types

The framework currently supports eight standard PDE policy types.

whitelist

Creates a value outside the allowed values.

Example

PREVENT
becomes
__PDE_MUTATION_OUTSIDE_ALLOWLIST__

blacklist

Replaces a safe value with a blacklisted value.

Example

DESKTOP_WINDOWS
becomes
OS_UNSPECIFIED

range

Creates values below the minimum and above the maximum boundary.

Example

Allowed range: 30 to 3650
Generated values: 29 and 3651

pattern whitelist

Creates a value where one wildcard section is outside the allowed values.

pattern blacklist

Creates a value where one wildcard section matches a blacklisted value.

Example

https://proxy.example.com
becomes
ftp://pde safe

element blacklist

Adds an array element that contains a blacklisted substring.

element pattern whitelist

Adds an array element that does not match any required wildcard shape.

map key blacklist

Adds a prohibited map key with a non empty value.

The original map is copied before the mutation is applied.

6. Project files

The framework is stored in this directory.

scripts/mutation_test/

Main files

mutation_test.py

Command line entry point. It runs one policy or all discovered policies for a resource.

resource_runner.py

Loads Terraform plan fixtures, runs mutations, calls OPA, and creates policy results.

operators.py

Contains the policy aware mutation operators for the eight supported policy types.

metadata.py

Reads the Rego package and standard PDE condition metadata.

mutators.py

Reads and updates nested values inside copied Terraform plan data.

evaluator.py

Runs the real PDE OPA evaluation and extracts non compliant resources from policy details.

report.py

Writes the JSON mutation report.

_tests/

Contains unit tests, integration tests, operator tests, resource runner tests, report tests, and command line tests.

7. Run one policy

Run the command from the root of the PDE repository.

python scripts\mutation_test\mutation_test.py "gcp/API Hub/google_apihub_curation/deletion_policy"

Example result

Mutation 1
Policy type : whitelist
Before      : PREVENT
After       : __PDE_MUTATION_OUTSIDE_ALLOWLIST__
New failures: ['compliant_example_1']
Result      : KILLED

8. Run all supported policies for one resource

Give the resource path instead of an individual policy path.

python scripts\mutation_test\mutation_test.py "gcp/API Hub/google_apihub_curation"

The framework discovers policy targets inside that resource and runs each one.

The final summary shows the number of compatible policies, unsupported policies, killed mutations, survived mutations, skipped mutations, errors, and the mutation score.

9. Create a JSON report

The command line tool also supports writing a machine readable JSON report. The report option can be used when running the tool.

The JSON report contains the overall summary and the result of every tested policy and mutation.

10. Mutation score

The score is calculated from tested mutations only.

Mutation score = Killed mutations divided by Killed plus Survived mutations multiplied by 100

Skipped and unsupported cases are not included in the score.

A score of 100 percent means every generated mutation that was tested was detected by the policy.

The score does not prove that a policy can detect every possible security problem. It only shows how the policy performed against the mutations generated by this framework.

11. Testing

Run all mutation framework tests with this command.

pytest scripts\mutation_test\_tests

Run coverage with this command.

pytest scripts\mutation_test\_tests

During development, the framework passed 39 tests and reached 77 percent overall test coverage.

The command line module reached 90 percent coverage.

12. Real PDE integration validation

The integration tests use real PDE policies and real committed Terraform plan fixtures.

The framework has been validated against examples of all eight supported policy types.

The tested examples include API Hub, Access Context Manager, Cloud Logging, Apigee, BigQuery Analytics Hub, and Dialogflow CX policies.

The integration tests confirm that generated mutations are evaluated by the real PDE OPA policy and are not simply copied from the non compliant Terraform fixture.

13. Important design choice

The framework does not mark a mutation as KILLED by searching for part of a resource name inside text output.

Instead, it reads the structured non compliant resource information from the policy details.

It compares the failures before and after the mutation.

A mutation is marked as KILLED only when the changed plan creates a new policy failure.

This avoids false matches where one resource name may appear inside another resource name.

14. Custom policies

Some PDE policies use custom Rego logic and define an empty conditions list.

These policies may use custom regex checks, custom nested loops, or their own path variables.

Because these policies do not follow one common structure, the framework currently reports them as UNSUPPORTED.

This is intentional. The tool avoids guessing the meaning of a custom policy because an incorrect generic mutation could produce misleading results.

Custom policy support can be extended later by adding clear metadata or dedicated mutation rules for those policy structures.

15. Current limitations

The framework expects committed Terraform plan fixtures in the existing PDE input structure.

The standard mutation engine depends on metadata exposed through the PDE conditions structure.

Custom Rego policies without standard condition metadata are currently unsupported.

The framework currently focuses on planned resources inside the root module.

Mutation score should be used as a testing signal, not as a complete measure of policy security.

16. Development goal

The goal of this contribution is to give PDE a repeatable way to test whether security policies can detect controlled insecure changes.

It adds another testing layer on top of normal compliant and non compliant fixture testing and gives developers a clear result for each generated mutation.
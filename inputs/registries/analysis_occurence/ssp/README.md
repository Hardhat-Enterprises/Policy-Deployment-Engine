Google Container Analysis Occurrence Policy

This repository contains a policy designed for managing Google Container Analysis Occurrences with respect to the security of the serialized payload, signature, and public key ID.
Policy Overview

The policy is implemented using OPA (Open Policy Agent), and it ensures that Google Container Analysis Occurrences meet security requirements related to the attestation fields. Specifically, the policy checks the following:

    Serialized Payload: Ensures that the serialized payload is correctly provided and properly encoded.

    Signature: Ensures that the signature is present and correctly generated.

    Public Key ID: Ensures that the public key ID is valid and formatted correctly.

How the Policy Works

    Serialized Payload: This field must not be empty or null. It is a base64-encoded string representing the payload that is verified by one or more signatures.

    Signature: This field must contain a valid signature over the serialized payload, which is used to verify the authenticity of the payload.

    Public Key ID: This field must be a valid RFC3986-conformant URI that refers to the public key used to verify the signature.

The policy evaluates these three aspects for each google_container_analysis_occurrence resource and provides detailed compliance information based on the configuration of these fields.
Resources Evaluated

The policy evaluates the following resources:

    Serialized Payload: Checks whether the field is non-empty and correctly encoded.

    Signature: Verifies that the field is non-empty and correctly generated.

    Public Key ID: Ensures that the public key ID is valid.

Files in This Repository
1. policy.rego

Contains the main policy definitions, including the rules for validating the serialized payload, signature, and public key ID in google_container_analysis_occurrence resources.
2. plan.json

A sample Terraform plan file containing the resources (google_container_analysis_occurrence) that will be evaluated by the policy.
3. vars.rego

Defines the variables that are used in the policy, including resource names, types, and values for evaluation.
4. Evaluation Output

The policy generates output in two forms:

    Message: A summary of the compliance evaluation for the resources.

    Details: A detailed report for debugging purposes, listing specific violations or confirmations of compliance.

How to Use This Policy

To use this policy, you need to have OPA installed on your system. Follow the steps below:

    Clone this repository to your local machine.

    Run the following command to evaluate the policy:

opa eval --data ./policies/gcp --input ./inputs/registries/analysis_occurrence/ssp/plan.json --format pretty "data.terraform.gcp.security.registries.google_container_analysis_occurrence.ssp.message"

This command will evaluate the resources in the provided plan.json file against the policy defined in policy.rego.
Expected Output

    If all resources are compliant, the output will show that the resources passed all the checks.

    If any resource is non-compliant, the output will provide details about the violation and possible remedies.

Future Work

    Enhancements: You may extend the policy by adding more checks for other fields within the google_container_analysis_occurrence resource.

    Integration: This policy can be integrated into automated CI/CD pipelines to ensure compliance with security best practices during the deployment of container analysis occurrences.
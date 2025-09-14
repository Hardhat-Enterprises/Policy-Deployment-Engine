#!/usr/bin/env python3
"""
Comprehensive OPA Policy Evaluation Script
Runs OPA evaluations for all GCP policies in the Policy Deployment Engine
"""

import os
import json
import subprocess
import sys
from pathlib import Path

def create_sample_input_data():
    """Create sample input data for OPA evaluation"""
    return {
        "planned_values": {
            "root_module": {
                "resources": [
                    {
                        "type": "google_dataform_repository_iam_binding",
                        "name": "c",
                        "values": {
                            "repository": "projects/my-project/locations/australia-southeast1/repositories/iam-policy-parent",
                            "role": "roles/viewer",
                            "members": ["user:alice@example.com"]
                        }
                    },
                    {
                        "type": "google_dataform_repository_iam_binding", 
                        "name": "nc",
                        "values": {
                            "repository": "projects/my-project/locations/us-central1/repositories/iam-policy-parent-nc",
                            "role": "roles/viewer",
                            "members": ["allUsers"]
                        }
                    }
                ]
            }
        }
    }

def find_all_policies():
    """Find all policy.rego files in the GCP policies directory"""
    policies_dir = Path("policies/gcp")
    policy_files = []
    
    for policy_file in policies_dir.rglob("policy.rego"):
        policy_files.append(policy_file)
    
    return sorted(policy_files)

def get_policy_package(policy_file):
    """Extract the package name from a policy file"""
    try:
        with open(policy_file, 'r') as f:
            content = f.read()
            for line in content.split('\n'):
                if line.startswith('package '):
                    return line.replace('package ', '').strip()
    except Exception as e:
        print(f"Error reading {policy_file}: {e}")
        return None

def run_opa_eval(policy_file, input_data, query):
    """Run OPA evaluation for a specific policy"""
    try:
        # Write input data to temporary file
        input_file = "temp_input.json"
        with open(input_file, 'w') as f:
            json.dump(input_data, f)
        
        # Run OPA evaluation
        cmd = [
            "opa", "eval",
            "-d", str(policy_file),
            "-d", "policies/gcp/_helpers/helpers.rego",
            "-d", str(policy_file.parent / "vars.rego") if (policy_file.parent / "vars.rego").exists() else "",
            "-i", input_file,
            "--format", "json",
            query
        ]
        
        # Remove empty strings from command
        cmd = [arg for arg in cmd if arg]
        
        result = subprocess.run(cmd, capture_output=True, text=True, timeout=30)
        
        # Clean up temp file
        if os.path.exists(input_file):
            os.remove(input_file)
            
        if result.returncode == 0:
            return json.loads(result.stdout)
        else:
            return {"error": result.stderr}
            
    except subprocess.TimeoutExpired:
        return {"error": "Timeout"}
    except Exception as e:
        return {"error": str(e)}

def main():
    """Main function to run OPA evaluations for all policies"""
    print("🔍 Running OPA evaluations for all GCP policies...")
    print("=" * 60)
    
    # Check if OPA is installed
    try:
        subprocess.run(["opa", "version"], capture_output=True, check=True)
    except (subprocess.CalledProcessError, FileNotFoundError):
        print("❌ OPA is not installed or not in PATH. Please install OPA first.")
        print("   Visit: https://www.openpolicyagent.org/docs/latest/#running-opa")
        sys.exit(1)
    
    # Create sample input data
    input_data = create_sample_input_data()
    
    # Find all policies
    policy_files = find_all_policies()
    
    if not policy_files:
        print("❌ No policy files found in policies/gcp/")
        sys.exit(1)
    
    print(f"📋 Found {len(policy_files)} policy files")
    print()
    
    results = {}
    successful_evals = 0
    failed_evals = 0
    
    for i, policy_file in enumerate(policy_files, 1):
        print(f"[{i}/{len(policy_files)}] Evaluating: {policy_file}")
        
        # Get package name
        package = get_policy_package(policy_file)
        if not package:
            print(f"   ⚠️  Could not determine package name")
            failed_evals += 1
            continue
        
        # Run evaluations for both message and details
        message_query = f"data.{package}.message"
        details_query = f"data.{package}.details"
        
        message_result = run_opa_eval(policy_file, input_data, message_query)
        details_result = run_opa_eval(policy_file, input_data, details_query)
        
        results[str(policy_file)] = {
            "package": package,
            "message": message_result,
            "details": details_result
        }
        
        if "error" not in message_result and "error" not in details_result:
            print(f"   ✅ Success")
            successful_evals += 1
            
            # Show a sample of the message result
            if isinstance(message_result, dict) and "result" in message_result:
                if message_result["result"]:
                    sample_msg = message_result["result"][0].get("expressions", [{}])[0].get("value", "")
                    if isinstance(sample_msg, list) and sample_msg:
                        print(f"      📝 Sample: {sample_msg[0][:100]}...")
        else:
            print(f"   ❌ Failed")
            failed_evals += 1
            if "error" in message_result:
                print(f"      Error: {message_result['error']}")
        
        print()
    
    # Summary
    print("=" * 60)
    print("📊 EVALUATION SUMMARY")
    print("=" * 60)
    print(f"Total policies: {len(policy_files)}")
    print(f"Successful evaluations: {successful_evals}")
    print(f"Failed evaluations: {failed_evals}")
    print(f"Success rate: {(successful_evals/len(policy_files)*100):.1f}%")
    
    # Save detailed results to JSON file
    output_file = "opa_evaluation_results.json"
    with open(output_file, 'w') as f:
        json.dump(results, f, indent=2)
    
    print(f"\n💾 Detailed results saved to: {output_file}")
    
    # Show some example results
    print("\n🔍 SAMPLE RESULTS:")
    print("-" * 40)
    
    for policy_file, result in list(results.items())[:3]:  # Show first 3 results
        if "error" not in result["message"]:
            print(f"\nPolicy: {policy_file}")
            print(f"Package: {result['package']}")
            if isinstance(result["message"], dict) and "result" in result["message"]:
                if result["message"]["result"]:
                    msg = result["message"]["result"][0].get("expressions", [{}])[0].get("value", "")
                    if isinstance(msg, list) and msg:
                        print(f"Message: {msg[0]}")

if __name__ == "__main__":
    main()

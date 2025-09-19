#!/usr/bin/env python3
"""
Script to run OPA evaluation for all dataform policies
"""

import os
import subprocess
import json
from pathlib import Path

def run_opa_eval(policy_path, input_path, query, format_type="pretty"):
    """Run OPA evaluation command"""
    cmd = [
        "opa", "eval",
        "--data", policy_path,
        "--input", input_path,
        query,
        "--format", format_type
    ]
    
    try:
        result = subprocess.run(cmd, capture_output=True, text=True, check=True)
        return result.stdout, result.stderr
    except subprocess.CalledProcessError as e:
        return None, e.stderr
    except FileNotFoundError:
        return None, "OPA command not found. Please install OPA first."

def get_dataform_policies():
    """Get all dataform policy directories"""
    policies_dir = Path("policies/gcp/dataform")
    inputs_dir = Path("inputs/gcp/dataform")
    
    policies = []
    
    # Find all policy directories
    for policy_dir in policies_dir.iterdir():
        if policy_dir.is_dir():
            policy_name = policy_dir.name
            input_policy_dir = inputs_dir / policy_name
            
            if input_policy_dir.exists():
                # Find all sub-policies within this policy directory
                for sub_policy_dir in policy_dir.iterdir():
                    if sub_policy_dir.is_dir():
                        sub_policy_name = sub_policy_dir.name
                        input_sub_policy_dir = input_policy_dir / sub_policy_name
                        
                        if input_sub_policy_dir.exists():
                            # Look for plan.json files
                            for plan_file in input_sub_policy_dir.rglob("plan.json"):
                                policies.append({
                                    "policy_name": policy_name,
                                    "sub_policy_name": sub_policy_name,
                                    "policy_path": str(policy_dir),
                                    "input_path": str(plan_file),
                                    "query_base": f"data.terraform.gcp.security.dataform.{policy_name}.{sub_policy_name}"
                                })
    
    return policies

def main():
    """Main function to run OPA evaluations"""
    print("🔍 Running OPA evaluation for all dataform policies...")
    print("=" * 80)
    
    policies = get_dataform_policies()
    
    if not policies:
        print("❌ No dataform policies found!")
        return
    
    print(f"📋 Found {len(policies)} policy configurations to evaluate")
    print()
    
    results = []
    
    for i, policy in enumerate(policies, 1):
        print(f"🔍 [{i}/{len(policies)}] Evaluating: {policy['policy_name']}.{policy['sub_policy_name']}")
        print(f"   Input: {policy['input_path']}")
        
        # Check if input file exists
        if not os.path.exists(policy['input_path']):
            print(f"   ❌ Input file not found: {policy['input_path']}")
            print()
            continue
        
        # Run message query
        message_query = f"{policy['query_base']}.message"
        print(f"   📝 Running message query: {message_query}")
        
        message_stdout, message_stderr = run_opa_eval(
            policy['policy_path'],
            policy['input_path'],
            message_query
        )
        
        if message_stdout is None:
            print(f"   ❌ Message query failed: {message_stderr}")
        else:
            print(f"   ✅ Message result:")
            print(f"      {message_stdout.strip()}")
        
        # Run details query
        details_query = f"{policy['query_base']}.details"
        print(f"   📊 Running details query: {details_query}")
        
        details_stdout, details_stderr = run_opa_eval(
            policy['policy_path'],
            policy['input_path'],
            details_query
        )
        
        if details_stdout is None:
            print(f"   ❌ Details query failed: {details_stderr}")
        else:
            print(f"   ✅ Details result:")
            print(f"      {details_stdout.strip()}")
        
        # Store results
        results.append({
            "policy": f"{policy['policy_name']}.{policy['sub_policy_name']}",
            "input_file": policy['input_path'],
            "message_result": message_stdout,
            "details_result": details_stdout,
            "message_error": message_stderr,
            "details_error": details_stderr
        })
        
        print("-" * 80)
        print()
    
    # Summary
    print("📊 SUMMARY")
    print("=" * 80)
    
    successful = sum(1 for r in results if r['message_result'] is not None and r['details_result'] is not None)
    failed = len(results) - successful
    
    print(f"✅ Successful evaluations: {successful}")
    print(f"❌ Failed evaluations: {failed}")
    print(f"📋 Total policies evaluated: {len(results)}")
    
    # Show failed evaluations
    if failed > 0:
        print("\n❌ Failed evaluations:")
        for result in results:
            if result['message_result'] is None or result['details_result'] is None:
                print(f"   - {result['policy']}: {result['input_file']}")
                if result['message_error']:
                    print(f"     Message error: {result['message_error']}")
                if result['details_error']:
                    print(f"     Details error: {result['details_error']}")

if __name__ == "__main__":
    main()


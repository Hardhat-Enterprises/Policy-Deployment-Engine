"""
Integration tests for end-to-end workflows.

Tests complete pipeline from CLI to JSON output using fixture files.
These tests validate the entire system working together without network dependencies.

Test Coverage:
    - Task 16.1: Complete pipeline from CLI input to JSON file output
    - Task 16.2: Change detection with version updates

Author: Terraform JSON Spec Generator Team
Version: 1.0.0
"""

import pytest
import json
import tempfile
import shutil
from pathlib import Path
from argparse import Namespace
from unittest.mock import patch, MagicMock
from datetime import datetime

from scripts.docgen_v2.lib.orchestrator import Orchestrator
from scripts.docgen_v2.lib.repository_manager import RepositoryManager


# Test Fixtures

@pytest.fixture
def temp_output_dir():
    """Provide a temporary directory for test outputs."""
    with tempfile.TemporaryDirectory() as tmp_dir:
        yield Path(tmp_dir)


@pytest.fixture
def fixture_dir():
    """Path to fixture files directory."""
    return Path(__file__).parent / 'fixtures'


@pytest.fixture
def temp_cache_dir():
    """Provide a temporary cache directory for testing."""
    with tempfile.TemporaryDirectory() as tmp_dir:
        cache_dir = Path(tmp_dir) / "test_cache"
        cache_dir.mkdir(parents=True, exist_ok=True)
        yield cache_dir


# Helper Functions

def setup_mock_repo_for_fixture(repo_manager, csp, fixture_file_path):
    """
    Configure repository manager to use a specific fixture file.
    
    This mocks the repository operations to return paths pointing to
    fixture files instead of cloned git repositories.
    
    Args:
        repo_manager: RepositoryManager instance to mock
        csp: Cloud service provider (aws, azure, gcp)
        fixture_file_path: Path to the fixture markdown file
    
    Returns:
        Mock repo path that can be used in tests
    """
    # Create a fake repo directory structure
    fake_repo_path = fixture_file_path.parent / f"fake_{csp}_repo"
    
    # Mock clone_provider_repo to return fake repo path
    with patch.object(repo_manager, 'clone_provider_repo', return_value=fake_repo_path):
        # Mock get_resource_markdown_path to return the fixture file
        with patch.object(repo_manager, 'get_resource_markdown_path', return_value=fixture_file_path):
            yield fake_repo_path


def verify_json_structure(json_data, expected_resource_name):
    """
    Verify that generated JSON has the correct structure.
    
    Checks for:
    - _metadata block with provider, version, generated_at
    - resource_name field
    - subcategory field
    - arguments dict
    
    Args:
        json_data: Parsed JSON data
        expected_resource_name: Expected resource name
    """
    # Check top-level structure
    assert '_metadata' in json_data, "Missing _metadata block"
    assert 'resource_name' in json_data, "Missing resource_name field"
    assert 'subcategory' in json_data, "Missing subcategory field"
    assert 'arguments' in json_data, "Missing arguments field"
    
    # Check metadata structure
    metadata = json_data['_metadata']
    assert 'provider' in metadata, "Missing provider in metadata"
    assert 'version' in metadata, "Missing version in metadata"
    assert 'generated_at' in metadata, "Missing generated_at in metadata"
    
    # Verify generated_at is valid ISO 8601 timestamp
    try:
        datetime.fromisoformat(metadata['generated_at'].replace('Z', '+00:00'))
    except ValueError:
        pytest.fail(f"Invalid timestamp format: {metadata['generated_at']}")
    
    # Check resource name matches
    assert json_data['resource_name'] == expected_resource_name, \
        f"Expected resource_name '{expected_resource_name}', got '{json_data['resource_name']}'"
    
    # Check arguments is a dict
    assert isinstance(json_data['arguments'], dict), "Arguments should be a dictionary"


def verify_argument_structure(argument_data):
    """
    Verify that an argument has all required fields.
    
    Args:
        argument_data: Argument data from JSON
    """
    required_fields = [
        'description', 'required', 'deprecated',
        'security_impact', 'rationale', 'compliant', 'non_compliant', 'parent'
    ]
    
    for field in required_fields:
        assert field in argument_data, f"Missing required field: {field}"
    
    # Check types
    assert isinstance(argument_data['description'], str), "Description should be string"
    assert argument_data['required'] in [True, False, None], "Required should be boolean or null"
    assert isinstance(argument_data['deprecated'], bool), "Deprecated should be boolean"
    
    # Security fields should be null initially
    assert argument_data['security_impact'] is None, "security_impact should be null"
    assert argument_data['rationale'] is None, "rationale should be null"
    assert argument_data['compliant'] is None, "compliant should be null"
    assert argument_data['non_compliant'] is None, "non_compliant should be null"


# Integration Tests for Task 16.1: Complete Pipeline

class TestCompletePipeline:
    """
    Integration tests for complete pipeline from CLI input to JSON output.
    
    Tests the end-to-end workflow:
    1. Parse CLI arguments
    2. Extract schemas from fixture files
    3. Process and validate resources
    4. Generate JSON output files
    5. Verify JSON structure and content
    6. Verify metadata file creation
    """
    
    def test_complete_pipeline_aws(self, temp_output_dir, fixture_dir, temp_cache_dir):
        """
        Test complete pipeline for AWS: CLI → extraction → processing → JSON output.
        
        Uses fixture: aws_s3_bucket_v6.23.0.md
        
        Validates:
        - JSON file is created at correct path
        - JSON has correct structure
        - Arguments are properly extracted
        - Metadata file is created
        """
        # Setup
        fixture_file = fixture_dir / 'aws' / 's3_bucket_v6.23.0.md'
        assert fixture_file.exists(), f"Fixture file not found: {fixture_file}"
        
        # Create arguments for orchestrator
        args = Namespace(
            csp='aws',
            service=['s3'],  # Specify service to limit scope
            provider_version='6.23.0',
            output_dir=temp_output_dir,
            dry_run=False,  # Actually write files
            silent=True,  # Suppress console output
            cache_dir=temp_cache_dir,
            update_cache=False
        )
        
        # Create orchestrator
        orchestrator = Orchestrator(args)
        
        # Mock repository operations to use fixture file
        with patch.object(orchestrator.repo_manager, 'clone_provider_repo') as mock_clone, \
             patch.object(orchestrator.repo_manager, 'get_resource_markdown_path') as mock_get_path, \
             patch.object(orchestrator.schema_extractor, 'list_available_resources') as mock_list:
            
            # Setup mocks
            fake_repo_path = temp_cache_dir / 'aws'
            mock_clone.return_value = fake_repo_path
            mock_get_path.return_value = fixture_file
            mock_list.return_value = ['aws_s3_bucket']
            
            # Run orchestrator
            exit_code = orchestrator.run()
            
            # Verify success
            assert exit_code == 0, f"Orchestrator failed with exit code: {exit_code}"
        
        # Verify JSON file was created
        # Expected path: docs/aws/S3_(Simple_Storage)/resource_json/s3_bucket.template.json
        json_file = temp_output_dir / 'aws' / 'S3_(Simple_Storage)' / 'resource_json' / 's3_bucket.template.json'
        assert json_file.exists(), f"JSON file not created: {json_file}"
        
        # Load and verify JSON content
        with open(json_file, 'r') as f:
            json_data = json.load(f)
        
        # Verify JSON structure
        verify_json_structure(json_data, 'aws_s3_bucket')
        
        # Verify metadata
        assert json_data['_metadata']['provider'] == 'aws'
        assert json_data['_metadata']['version'] == '6.23.0'
        
        # Verify subcategory is extracted
        assert json_data['subcategory'] is not None
        assert len(json_data['subcategory']) > 0
        
        # Verify arguments were extracted
        assert len(json_data['arguments']) > 0, "No arguments extracted"
        
        # Verify at least one argument has correct structure
        first_arg_name = list(json_data['arguments'].keys())[0]
        first_arg = json_data['arguments'][first_arg_name]
        verify_argument_structure(first_arg)
        
        # Verify metadata file was created
        # Expected pattern: docs/aws/_history/{timestamp}.json
        metadata_files = list((temp_output_dir / 'aws' / '_history').glob('*.json'))
        assert len(metadata_files) > 0, "No metadata file created"
        
        # Load and verify metadata content
        with open(metadata_files[0], 'r') as f:
            metadata = json.load(f)
        
        assert metadata['dry_run'] is False
        assert metadata['provider'] == 'aws'
        assert metadata['version'] == '6.23.0'
        assert 'generated_at' in metadata
        assert 'resources' in metadata
        assert 'statistics' in metadata
        
        # Verify resources list includes our resource
        assert 'S3 (Simple Storage)' in metadata['resources']
        assert 'aws_s3_bucket' in metadata['resources']['S3 (Simple Storage)']
    
    def test_complete_pipeline_azure(self, temp_output_dir, fixture_dir, temp_cache_dir):
        """
        Test complete pipeline for Azure: CLI → extraction → processing → JSON output.
        
        Uses fixture: azurerm_storage_account_v4.54.0.md
        
        Validates:
        - JSON file is created at correct path
        - JSON has correct structure
        - Arguments are properly extracted
        - Metadata file is created
        """
        # Setup
        fixture_file = fixture_dir / 'azure' / 'storage_account_v4.54.0.md'
        assert fixture_file.exists(), f"Fixture file not found: {fixture_file}"
        
        # Create arguments for orchestrator
        args = Namespace(
            csp='azure',
            service=['storage'],  # Specify service
            provider_version='4.54.0',
            output_dir=temp_output_dir,
            dry_run=False,
            silent=True,
            cache_dir=temp_cache_dir,
            update_cache=False
        )
        
        # Create orchestrator
        orchestrator = Orchestrator(args)
        
        # Mock repository operations to use fixture file
        with patch.object(orchestrator.repo_manager, 'clone_provider_repo') as mock_clone, \
             patch.object(orchestrator.repo_manager, 'get_resource_markdown_path') as mock_get_path, \
             patch.object(orchestrator.schema_extractor, 'list_available_resources') as mock_list:
            
            # Setup mocks
            fake_repo_path = temp_cache_dir / 'azure'
            mock_clone.return_value = fake_repo_path
            mock_get_path.return_value = fixture_file
            mock_list.return_value = ['azurerm_storage_account']
            
            # Run orchestrator
            exit_code = orchestrator.run()
            
            # Verify success
            assert exit_code == 0, f"Orchestrator failed with exit code: {exit_code}"
        
        # Verify JSON file was created
        # Expected path: docs/azure/Storage/resource_json/storage_account.template.json
        json_file = temp_output_dir / 'azure' / 'Storage' / 'resource_json' / 'storage_account.template.json'
        assert json_file.exists(), f"JSON file not created: {json_file}"
        
        # Load and verify JSON content
        with open(json_file, 'r') as f:
            json_data = json.load(f)
        
        # Verify JSON structure
        verify_json_structure(json_data, 'azurerm_storage_account')
        
        # Verify metadata
        assert json_data['_metadata']['provider'] == 'azure'
        assert json_data['_metadata']['version'] == '4.54.0'
        
        # Verify arguments were extracted
        assert len(json_data['arguments']) > 0, "No arguments extracted"
        
        # Verify metadata file was created
        metadata_files = list((temp_output_dir / 'azure' / '_history').glob('*.json'))
        assert len(metadata_files) > 0, "No metadata file created"
        
        # Load and verify metadata content
        with open(metadata_files[0], 'r') as f:
            metadata = json.load(f)
        
        assert metadata['dry_run'] is False
        assert metadata['provider'] == 'azure'
        assert metadata['version'] == '4.54.0'
        assert 'generated_at' in metadata
        assert 'resources' in metadata
        assert 'statistics' in metadata
        
        # Verify resources list includes our resource
        assert 'Storage' in metadata['resources']
        assert 'azurerm_storage_account' in metadata['resources']['Storage']
    
    def test_complete_pipeline_gcp(self, temp_output_dir, fixture_dir, temp_cache_dir):
        """
        Test complete pipeline for GCP: CLI → extraction → processing → JSON output.
        
        Uses fixture: google_storage_bucket_v7.12.0.md
        
        Validates:
        - JSON file is created at correct path
        - JSON has correct structure
        - Arguments are properly extracted
        - Metadata file is created
        """
        # Setup
        fixture_file = fixture_dir / 'gcp' / 'storage_bucket_v7.12.0.md'
        assert fixture_file.exists(), f"Fixture file not found: {fixture_file}"
        
        # Create arguments for orchestrator
        args = Namespace(
            csp='gcp',
            service=['storage'],  # Specify service
            provider_version='7.12.0',
            output_dir=temp_output_dir,
            dry_run=False,
            silent=True,
            cache_dir=temp_cache_dir,
            update_cache=False
        )
        
        # Create orchestrator
        orchestrator = Orchestrator(args)
        
        # Mock repository operations to use fixture file
        with patch.object(orchestrator.repo_manager, 'clone_provider_repo') as mock_clone, \
             patch.object(orchestrator.repo_manager, 'get_resource_markdown_path') as mock_get_path, \
             patch.object(orchestrator.schema_extractor, 'list_available_resources') as mock_list:
            
            # Setup mocks
            fake_repo_path = temp_cache_dir / 'gcp'
            mock_clone.return_value = fake_repo_path
            mock_get_path.return_value = fixture_file
            mock_list.return_value = ['google_storage_bucket']
            
            # Run orchestrator
            exit_code = orchestrator.run()
            
            # Verify success
            assert exit_code == 0, f"Orchestrator failed with exit code: {exit_code}"
        
        # Verify JSON file was created
        # Expected path: docs/gcp/Cloud_Storage/resource_json/storage_bucket.template.json
        json_file = temp_output_dir / 'gcp' / 'Cloud_Storage' / 'resource_json' / 'storage_bucket.template.json'
        assert json_file.exists(), f"JSON file not created: {json_file}"
        
        # Load and verify JSON content
        with open(json_file, 'r') as f:
            json_data = json.load(f)
        
        # Verify JSON structure
        verify_json_structure(json_data, 'google_storage_bucket')
        
        # Verify metadata
        assert json_data['_metadata']['provider'] == 'gcp'
        assert json_data['_metadata']['version'] == '7.12.0'
        
        # Verify arguments were extracted
        assert len(json_data['arguments']) > 0, "No arguments extracted"
        
        # Verify metadata file was created
        metadata_files = list((temp_output_dir / 'gcp' / '_history').glob('*.json'))
        assert len(metadata_files) > 0, "No metadata file created"
        
        # Load and verify metadata content
        with open(metadata_files[0], 'r') as f:
            metadata = json.load(f)
        
        assert metadata['dry_run'] is False
        assert metadata['provider'] == 'gcp'
        assert metadata['version'] == '7.12.0'
        assert 'generated_at' in metadata
        assert 'resources' in metadata
        assert 'statistics' in metadata
        
        # Verify resources list includes our resource
        assert 'Cloud Storage' in metadata['resources']
        assert 'google_storage_bucket' in metadata['resources']['Cloud Storage']


# Integration Tests for Task 16.2: Change Detection

class TestChangeDetection:
    """
    Integration tests for change detection with version updates.
    
    Tests the end-to-end workflow for detecting and reporting changes:
    1. Process resource with old version
    2. Process same resource with new version
    3. Verify change reports are generated
    4. Verify change reports contain correct information
    5. Verify summary reports are created
    
    Test Coverage:
    - Test 1: Added arguments (AWS EKS Cluster)
    - Test 2: Removed arguments (GCP Container Cluster)
    - Test 3: Multiple changes (Azure Kubernetes Cluster)
    - Test 4: Batch processing with multiple resources (AWS)
    """
    
    def test_change_detection_added_arguments_aws_eks(self, temp_output_dir, fixture_dir, temp_cache_dir):
        """
        Test change detection for added arguments: AWS EKS Cluster v6.20.0 → v6.23.0.
        
        Uses fixtures:
        - aws/eks_cluster_v6.20.0.md (old version)
        - aws/eks_cluster_v6.23.0.md (new version)
        
        Expected changes:
        - 1 added argument: control_plane_scaling_config
        
        Validates:
        - Change report is created
        - Added arguments section is present
        - Summary report is created
        """
        # Step 1: Process old version
        old_fixture = fixture_dir / 'aws' / 'eks_cluster_v6.20.0.md'
        assert old_fixture.exists(), f"Old fixture not found: {old_fixture}"
        
        old_args = Namespace(
            csp='aws',
            service=['eks'],
            provider_version='6.20.0',
            output_dir=temp_output_dir,
            dry_run=False,
            silent=True,
            cache_dir=temp_cache_dir,
            update_cache=False
        )
        
        old_orchestrator = Orchestrator(old_args)
        
        with patch.object(old_orchestrator.repo_manager, 'clone_provider_repo') as mock_clone, \
             patch.object(old_orchestrator.repo_manager, 'get_resource_markdown_path') as mock_get_path, \
             patch.object(old_orchestrator.schema_extractor, 'list_available_resources') as mock_list:
            
            fake_repo_path = temp_cache_dir / 'aws'
            mock_clone.return_value = fake_repo_path
            mock_get_path.return_value = old_fixture
            mock_list.return_value = ['aws_eks_cluster']
            
            exit_code = old_orchestrator.run()
            assert exit_code == 0, f"Old version processing failed: {exit_code}"
        
        # Step 2: Process new version
        new_fixture = fixture_dir / 'aws' / 'eks_cluster_v6.23.0.md'
        assert new_fixture.exists(), f"New fixture not found: {new_fixture}"
        
        new_args = Namespace(
            csp='aws',
            service=['eks'],
            provider_version='6.23.0',
            output_dir=temp_output_dir,
            dry_run=False,
            silent=True,
            cache_dir=temp_cache_dir,
            update_cache=False
        )
        
        new_orchestrator = Orchestrator(new_args)
        
        with patch.object(new_orchestrator.repo_manager, 'clone_provider_repo') as mock_clone, \
             patch.object(new_orchestrator.repo_manager, 'get_resource_markdown_path') as mock_get_path, \
             patch.object(new_orchestrator.schema_extractor, 'list_available_resources') as mock_list:
            
            fake_repo_path = temp_cache_dir / 'aws'
            mock_clone.return_value = fake_repo_path
            mock_get_path.return_value = new_fixture
            mock_list.return_value = ['aws_eks_cluster']
            
            exit_code = new_orchestrator.run()
            assert exit_code == 0, f"New version processing failed: {exit_code}"
        
        # Step 3: Verify change report was created
        change_report_dir = temp_output_dir / 'aws' / '_changes' / '6.20.0-to-6.23.0'
        assert change_report_dir.exists(), f"Change report directory not created: {change_report_dir}"
        
        resource_report = change_report_dir / 'aws_eks_cluster.md'
        assert resource_report.exists(), f"Resource change report not created: {resource_report}"
        
        # Step 4: Verify change report content
        report_content = resource_report.read_text()
        assert "# Resource: aws_eks_cluster" in report_content
        assert "6.20.0 → 6.23.0" in report_content
        assert "## Added Arguments" in report_content, "Missing added arguments section"
        assert "control_plane_scaling_config" in report_content, "Missing expected added argument"
        
        # Step 5: Verify summary report
        summary_report = change_report_dir / 'summary.md'
        assert summary_report.exists(), f"Summary report not created: {summary_report}"
        
        summary_content = summary_report.read_text()
        assert "# Change Summary" in summary_content
        assert "aws_eks_cluster" in summary_content
    
    def test_change_detection_removed_arguments_gcp_container(self, temp_output_dir, fixture_dir, temp_cache_dir):
        """
        Test change detection for removed arguments: GCP Container Cluster v7.9.0 → v7.12.0.
        
        Uses fixtures:
        - gcp/container_cluster_v7.9.0.md (old version)
        - gcp/container_cluster_v7.12.0.md (new version)
        
        Expected changes:
        - 3 removed arguments: end_time_behavior, network_tier, network_tier_config
        - 5 description changes
        
        Validates:
        - Change report is created
        - Removed arguments section is present
        - Summary report is created
        """
        # Step 1: Process old version
        old_fixture = fixture_dir / 'gcp' / 'container_cluster_v7.9.0.md'
        assert old_fixture.exists(), f"Old fixture not found: {old_fixture}"
        
        old_args = Namespace(
            csp='gcp',
            service=['container'],
            provider_version='7.9.0',
            output_dir=temp_output_dir,
            dry_run=False,
            silent=True,
            cache_dir=temp_cache_dir,
            update_cache=False
        )
        
        old_orchestrator = Orchestrator(old_args)
        
        with patch.object(old_orchestrator.repo_manager, 'clone_provider_repo') as mock_clone, \
             patch.object(old_orchestrator.repo_manager, 'get_resource_markdown_path') as mock_get_path, \
             patch.object(old_orchestrator.schema_extractor, 'list_available_resources') as mock_list:
            
            fake_repo_path = temp_cache_dir / 'gcp'
            mock_clone.return_value = fake_repo_path
            mock_get_path.return_value = old_fixture
            mock_list.return_value = ['google_container_cluster']
            
            exit_code = old_orchestrator.run()
            assert exit_code == 0, f"Old version processing failed: {exit_code}"
        
        # Step 2: Process new version
        new_fixture = fixture_dir / 'gcp' / 'container_cluster_v7.12.0.md'
        assert new_fixture.exists(), f"New fixture not found: {new_fixture}"
        
        new_args = Namespace(
            csp='gcp',
            service=['container'],
            provider_version='7.12.0',
            output_dir=temp_output_dir,
            dry_run=False,
            silent=True,
            cache_dir=temp_cache_dir,
            update_cache=False
        )
        
        new_orchestrator = Orchestrator(new_args)
        
        with patch.object(new_orchestrator.repo_manager, 'clone_provider_repo') as mock_clone, \
             patch.object(new_orchestrator.repo_manager, 'get_resource_markdown_path') as mock_get_path, \
             patch.object(new_orchestrator.schema_extractor, 'list_available_resources') as mock_list:
            
            fake_repo_path = temp_cache_dir / 'gcp'
            mock_clone.return_value = fake_repo_path
            mock_get_path.return_value = new_fixture
            mock_list.return_value = ['google_container_cluster']
            
            exit_code = new_orchestrator.run()
            assert exit_code == 0, f"New version processing failed: {exit_code}"
        
        # Step 3: Verify change report was created
        change_report_dir = temp_output_dir / 'gcp' / '_changes' / '7.9.0-to-7.12.0'
        assert change_report_dir.exists(), f"Change report directory not created: {change_report_dir}"
        
        resource_report = change_report_dir / 'google_container_cluster.md'
        assert resource_report.exists(), f"Resource change report not created: {resource_report}"
        
        # Step 4: Verify change report content
        report_content = resource_report.read_text()
        assert "# Resource: google_container_cluster" in report_content
        assert "7.9.0 → 7.12.0" in report_content
        assert "## Added Arguments" in report_content, "Missing added arguments section"
        
        # Verify at least one of the added arguments is listed
        has_added_arg = any(arg in report_content for arg in ['end_time_behavior', 'network_tier', 'network_tier_config'])
        assert has_added_arg, "Missing expected added arguments"
        
        # Step 5: Verify summary report
        summary_report = change_report_dir / 'summary.md'
        assert summary_report.exists(), f"Summary report not created: {summary_report}"
        
        summary_content = summary_report.read_text()
        assert "# Change Summary" in summary_content
        assert "google_container_cluster" in summary_content
    
    def test_change_detection_multiple_changes_azure_kubernetes(self, temp_output_dir, fixture_dir, temp_cache_dir):
        """
        Test change detection for multiple changes: Azure Kubernetes Cluster v4.51.0 → v4.54.0.
        
        Uses fixtures:
        - azure/kubernetes_cluster_v4.51.0.md (old version)
        - azure/kubernetes_cluster_v4.54.0.md (new version)
        
        Expected changes:
        - 2 added arguments: gpu_driver, undrainable_node_behavior
        - 24 description changes
        
        Validates:
        - Change report is created
        - Multiple change types are detected
        - Summary report shows comprehensive statistics
        """
        # Step 1: Process old version
        old_fixture = fixture_dir / 'azure' / 'kubernetes_cluster_v4.51.0.md'
        assert old_fixture.exists(), f"Old fixture not found: {old_fixture}"
        
        old_args = Namespace(
            csp='azure',
            service=['kubernetes'],
            provider_version='4.51.0',
            output_dir=temp_output_dir,
            dry_run=False,
            silent=True,
            cache_dir=temp_cache_dir,
            update_cache=False
        )
        
        old_orchestrator = Orchestrator(old_args)
        
        with patch.object(old_orchestrator.repo_manager, 'clone_provider_repo') as mock_clone, \
             patch.object(old_orchestrator.repo_manager, 'get_resource_markdown_path') as mock_get_path, \
             patch.object(old_orchestrator.schema_extractor, 'list_available_resources') as mock_list:
            
            fake_repo_path = temp_cache_dir / 'azure'
            mock_clone.return_value = fake_repo_path
            mock_get_path.return_value = old_fixture
            mock_list.return_value = ['azurerm_kubernetes_cluster']
            
            exit_code = old_orchestrator.run()
            assert exit_code == 0, f"Old version processing failed: {exit_code}"
        
        # Step 2: Process new version
        new_fixture = fixture_dir / 'azure' / 'kubernetes_cluster_v4.54.0.md'
        assert new_fixture.exists(), f"New fixture not found: {new_fixture}"
        
        new_args = Namespace(
            csp='azure',
            service=['kubernetes'],
            provider_version='4.54.0',
            output_dir=temp_output_dir,
            dry_run=False,
            silent=True,
            cache_dir=temp_cache_dir,
            update_cache=False
        )
        
        new_orchestrator = Orchestrator(new_args)
        
        with patch.object(new_orchestrator.repo_manager, 'clone_provider_repo') as mock_clone, \
             patch.object(new_orchestrator.repo_manager, 'get_resource_markdown_path') as mock_get_path, \
             patch.object(new_orchestrator.schema_extractor, 'list_available_resources') as mock_list:
            
            fake_repo_path = temp_cache_dir / 'azure'
            mock_clone.return_value = fake_repo_path
            mock_get_path.return_value = new_fixture
            mock_list.return_value = ['azurerm_kubernetes_cluster']
            
            exit_code = new_orchestrator.run()
            assert exit_code == 0, f"New version processing failed: {exit_code}"
        
        # Step 3: Verify change report was created
        change_report_dir = temp_output_dir / 'azure' / '_changes' / '4.51.0-to-4.54.0'
        assert change_report_dir.exists(), f"Change report directory not created: {change_report_dir}"
        
        resource_report = change_report_dir / 'azurerm_kubernetes_cluster.md'
        assert resource_report.exists(), f"Resource change report not created: {resource_report}"
        
        # Step 4: Verify change report content
        report_content = resource_report.read_text()
        assert "# Resource: azurerm_kubernetes_cluster" in report_content
        assert "4.51.0 → 4.54.0" in report_content
        
        # Should have both added arguments and modified arguments
        assert "## Added Arguments" in report_content, "Missing added arguments section"
        assert "## Modified Arguments" in report_content, "Missing modified arguments section"
        
        # Verify at least one added argument is listed
        has_added_arg = any(arg in report_content for arg in ['gpu_driver', 'undrainable_node_behavior'])
        assert has_added_arg, "Missing expected added arguments"
        
        # Step 5: Verify summary report
        summary_report = change_report_dir / 'summary.md'
        assert summary_report.exists(), f"Summary report not created: {summary_report}"
        
        summary_content = summary_report.read_text()
        assert "# Change Summary" in summary_content
        assert "azurerm_kubernetes_cluster" in summary_content
        assert "## Overall Statistics" in summary_content
    
    def test_change_detection_batch_processing_aws(self, temp_output_dir, fixture_dir, temp_cache_dir):
        """
        Test change detection with multiple resources in batch: AWS v6.20.0 → v6.23.0.
        
        Uses fixtures:
        - aws/eks_cluster (v6.20.0 → v6.23.0) - has 1 added argument
        - aws/dynamodb_table (v6.20.0 → v6.23.0) - has 1 added argument
        
        Validates:
        - Multiple change reports are created
        - Summary report lists all changed resources
        - Statistics are correct
        """
        # Step 1: Process old version with multiple resources
        old_args = Namespace(
            csp='aws',
            service=['eks', 'dynamodb'],
            provider_version='6.20.0',
            output_dir=temp_output_dir,
            dry_run=False,
            silent=True,
            cache_dir=temp_cache_dir,
            update_cache=False
        )
        
        old_orchestrator = Orchestrator(old_args)
        
        with patch.object(old_orchestrator.repo_manager, 'clone_provider_repo') as mock_clone, \
             patch.object(old_orchestrator.repo_manager, 'get_resource_markdown_path') as mock_get_path, \
             patch.object(old_orchestrator.schema_extractor, 'list_available_resources') as mock_list:
            
            fake_repo_path = temp_cache_dir / 'aws'
            mock_clone.return_value = fake_repo_path
            
            # Mock to return appropriate fixture based on resource name
            def get_fixture_path(repo_path, resource_name):
                if resource_name == 'aws_eks_cluster':
                    return fixture_dir / 'aws' / 'eks_cluster_v6.20.0.md'
                elif resource_name == 'aws_dynamodb_table':
                    return fixture_dir / 'aws' / 'dynamodb_table_v6.20.0.md'
                return None
            
            mock_get_path.side_effect = get_fixture_path
            mock_list.return_value = ['aws_eks_cluster', 'aws_dynamodb_table']
            
            exit_code = old_orchestrator.run()
            assert exit_code == 0, f"Old version processing failed: {exit_code}"
        
        # Step 2: Process new version with multiple resources
        new_args = Namespace(
            csp='aws',
            service=['eks', 'dynamodb'],
            provider_version='6.23.0',
            output_dir=temp_output_dir,
            dry_run=False,
            silent=True,
            cache_dir=temp_cache_dir,
            update_cache=False
        )
        
        new_orchestrator = Orchestrator(new_args)
        
        with patch.object(new_orchestrator.repo_manager, 'clone_provider_repo') as mock_clone, \
             patch.object(new_orchestrator.repo_manager, 'get_resource_markdown_path') as mock_get_path, \
             patch.object(new_orchestrator.schema_extractor, 'list_available_resources') as mock_list:
            
            fake_repo_path = temp_cache_dir / 'aws'
            mock_clone.return_value = fake_repo_path
            
            # Mock to return appropriate fixture based on resource name
            def get_fixture_path(repo_path, resource_name):
                if resource_name == 'aws_eks_cluster':
                    return fixture_dir / 'aws' / 'eks_cluster_v6.23.0.md'
                elif resource_name == 'aws_dynamodb_table':
                    return fixture_dir / 'aws' / 'dynamodb_table_v6.23.0.md'
                return None
            
            mock_get_path.side_effect = get_fixture_path
            mock_list.return_value = ['aws_eks_cluster', 'aws_dynamodb_table']
            
            exit_code = new_orchestrator.run()
            assert exit_code == 0, f"New version processing failed: {exit_code}"
        
        # Step 3: Verify change reports were created for both resources
        change_report_dir = temp_output_dir / 'aws' / '_changes' / '6.20.0-to-6.23.0'
        assert change_report_dir.exists(), "Change report directory not created"
        
        eks_report = change_report_dir / 'aws_eks_cluster.md'
        dynamodb_report = change_report_dir / 'aws_dynamodb_table.md'
        
        assert eks_report.exists(), "EKS cluster change report not created"
        assert dynamodb_report.exists(), "DynamoDB table change report not created"
        
        # Step 4: Verify summary report lists both resources
        summary_report = change_report_dir / 'summary.md'
        assert summary_report.exists(), "Summary report not created"
        
        summary_content = summary_report.read_text()
        assert "aws_eks_cluster" in summary_content, "EKS cluster not in summary"
        assert "aws_dynamodb_table" in summary_content, "DynamoDB table not in summary"
        assert "## Overall Statistics" in summary_content, "Missing statistics"
        
        # Verify statistics show 2 resources changed (with markdown bold)
        assert "**Resources Changed:** 2" in summary_content, "Incorrect resource count in summary"


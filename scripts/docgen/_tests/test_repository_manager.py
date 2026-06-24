"""
Unit tests for Repository Manager

Tests the repository management functionality including:
- Sparse checkout
- Cache reuse logic
- Version checkout
- Resource listing and filtering

Note: These tests use real git operations but work with a temporary
cache directory to avoid polluting the user's cache.
"""

import pytest
from pathlib import Path
from unittest.mock import patch, MagicMock
from scripts.docgen.lib.repository_manager import RepositoryManager, PROVIDER_REPOS


@pytest.fixture
def temp_cache_dir(tmp_path):
    """Provide a temporary cache directory for testing."""
    cache_dir = tmp_path / "test_cache"
    cache_dir.mkdir(parents=True, exist_ok=True)
    return cache_dir


@pytest.fixture
def repo_manager(temp_cache_dir):
    """Provide a RepositoryManager instance with temporary cache."""
    return RepositoryManager(cache_dir=temp_cache_dir)


class TestRepositoryManagerInit:
    """Test RepositoryManager initialization."""
    
    def test_default_cache_dir(self):
        """Test that default cache directory is set correctly."""
        repo_mgr = RepositoryManager()
        # Default is scripts/docgen/.cache/, anchored to the source module
        # (repository_manager.py lives in scripts/docgen/lib/) so this stays
        # correct regardless of where the test file itself lives.
        import scripts.docgen.lib.repository_manager as rm_mod
        expected_dir = Path(rm_mod.__file__).parent.parent / '.cache'
        assert repo_mgr.cache_dir == expected_dir
    
    def test_custom_cache_dir(self, temp_cache_dir):
        """Test that custom cache directory is used."""
        repo_mgr = RepositoryManager(cache_dir=temp_cache_dir)
        assert repo_mgr.cache_dir == temp_cache_dir


class TestCloneProviderRepo:
    """Test repository cloning functionality."""
    
    def test_unsupported_csp_raises_error(self, repo_manager):
        """Test that unsupported CSP raises ConfigurationError."""
        from scripts.docgen.lib.errors import ConfigurationError
        with pytest.raises(ConfigurationError, match="Unsupported CSP"):
            repo_manager.clone_provider_repo('invalid_csp')
    
    def test_supported_csps(self, repo_manager):
        """Test that all supported CSPs are recognized."""
        for csp in ['aws', 'azure', 'gcp']:
            assert csp in PROVIDER_REPOS
    
    @patch('subprocess.run')
    def test_sparse_checkout_commands(self, mock_run, repo_manager):
        """Test that sparse checkout uses correct git commands."""
        mock_run.return_value = MagicMock(returncode=0, stdout='', stderr='')
        
        try:
            repo_manager.clone_provider_repo('aws')
        except Exception:
            pass  # We expect this to fail in test environment
        
        # Verify git init was called
        init_calls = [call for call in mock_run.call_args_list 
                     if 'init' in str(call)]
        assert len(init_calls) > 0
        
        # Verify sparse checkout config was set
        config_calls = [call for call in mock_run.call_args_list 
                       if 'sparseCheckout' in str(call)]
        assert len(config_calls) > 0
    
    @patch('subprocess.run')
    def test_cache_reuse(self, mock_run, repo_manager, temp_cache_dir):
        """Test that existing repository is reused (cache hit)."""
        # Create a fake cached repo
        repo_path = temp_cache_dir / 'aws'
        repo_path.mkdir(parents=True, exist_ok=True)
        (repo_path / '.git').mkdir(exist_ok=True)
        
        # Call clone_provider_repo
        result = repo_manager.clone_provider_repo('aws')
        
        # Should return existing path without cloning
        assert result == repo_path
        
        # Git init should NOT be called (cache hit)
        init_calls = [call for call in mock_run.call_args_list 
                     if 'init' in str(call)]
        assert len(init_calls) == 0
    
    @patch('subprocess.run')
    def test_version_checkout(self, mock_run, repo_manager, temp_cache_dir):
        """Test that version-specific checkout is performed."""
        mock_run.return_value = MagicMock(returncode=0, stdout='', stderr='')
        
        # Create a fake cached repo
        repo_path = temp_cache_dir / 'aws'
        repo_path.mkdir(parents=True, exist_ok=True)
        (repo_path / '.git').mkdir(exist_ok=True)
        
        # Call with version
        repo_manager.clone_provider_repo('aws', version='5.70.0')
        
        # Verify git checkout was called with version tag
        checkout_calls = [call for call in mock_run.call_args_list 
                         if 'checkout' in str(call) and 'v5.70.0' in str(call)]
        assert len(checkout_calls) > 0
    
    @patch('subprocess.run')
    def test_version_normalization(self, mock_run, repo_manager, temp_cache_dir):
        """Test that version without 'v' prefix gets normalized."""
        mock_run.return_value = MagicMock(returncode=0, stdout='', stderr='')
        
        # Create a fake cached repo
        repo_path = temp_cache_dir / 'aws'
        repo_path.mkdir(parents=True, exist_ok=True)
        (repo_path / '.git').mkdir(exist_ok=True)
        
        # Call with version without 'v' prefix
        repo_manager.clone_provider_repo('aws', version='5.70.0')
        
        # Verify 'v' prefix was added
        checkout_calls = [call for call in mock_run.call_args_list 
                         if 'checkout' in str(call)]
        assert any('v5.70.0' in str(call) for call in checkout_calls)


class TestGetResourceMarkdownPath:
    """Test resource markdown path resolution."""
    
    def test_aws_resource_path(self, repo_manager, temp_cache_dir):
        """Test AWS resource path construction."""
        repo_path = temp_cache_dir / 'aws'
        docs_dir = repo_path / 'website' / 'docs' / 'r'
        docs_dir.mkdir(parents=True, exist_ok=True)
        
        # Create a fake markdown file
        markdown_file = docs_dir / 's3_bucket.html.markdown'
        markdown_file.write_text('# Resource: aws_s3_bucket')
        
        # Get path
        result = repo_manager.get_resource_markdown_path(repo_path, 'aws_s3_bucket')
        
        assert result == markdown_file
        assert result.exists()
    
    def test_azure_resource_path(self, repo_manager, temp_cache_dir):
        """Test Azure resource path construction."""
        repo_path = temp_cache_dir / 'azure'
        docs_dir = repo_path / 'website' / 'docs' / 'r'
        docs_dir.mkdir(parents=True, exist_ok=True)
        
        # Create a fake markdown file
        markdown_file = docs_dir / 'storage_account.html.markdown'
        markdown_file.write_text('# azurerm_storage_account')
        
        # Get path
        result = repo_manager.get_resource_markdown_path(
            repo_path, 'azurerm_storage_account'
        )
        
        assert result == markdown_file
        assert result.exists()
    
    def test_gcp_resource_path(self, repo_manager, temp_cache_dir):
        """Test GCP resource path construction."""
        repo_path = temp_cache_dir / 'gcp'
        docs_dir = repo_path / 'website' / 'docs' / 'r'
        docs_dir.mkdir(parents=True, exist_ok=True)
        
        # Create a fake markdown file
        markdown_file = docs_dir / 'storage_bucket.html.markdown'
        markdown_file.write_text('# google_storage_bucket')
        
        # Get path
        result = repo_manager.get_resource_markdown_path(
            repo_path, 'google_storage_bucket'
        )
        
        assert result == markdown_file
        assert result.exists()
    
    def test_missing_file_raises_error(self, repo_manager, temp_cache_dir):
        """Test that missing markdown file raises FileNotFoundError."""
        repo_path = temp_cache_dir / 'aws'
        docs_dir = repo_path / 'website' / 'docs' / 'r'
        docs_dir.mkdir(parents=True, exist_ok=True)
        
        from scripts.docgen.lib.errors import ParsingError
        with pytest.raises(ParsingError, match="Markdown file not found"):
            repo_manager.get_resource_markdown_path(repo_path, 'aws_nonexistent')


class TestListAllResources:
    """Test listing all resources in a repository."""
    
    def test_list_aws_resources(self, repo_manager, temp_cache_dir):
        """Test listing AWS resources."""
        repo_path = temp_cache_dir / 'aws'
        docs_dir = repo_path / 'website' / 'docs' / 'r'
        docs_dir.mkdir(parents=True, exist_ok=True)
        
        # Create fake markdown files
        (docs_dir / 's3_bucket.html.markdown').write_text('# Resource: aws_s3_bucket')
        (docs_dir / 'ec2_instance.html.markdown').write_text('# Resource: aws_instance')
        (docs_dir / 'lambda_function.html.markdown').write_text('# Resource: aws_lambda_function')
        
        resources = repo_manager.list_all_resources(repo_path)
        
        assert len(resources) == 3
        assert 'aws_s3_bucket' in resources
        assert 'aws_ec2_instance' in resources
        assert 'aws_lambda_function' in resources
        assert resources == sorted(resources)  # Should be sorted
    
    def test_list_azure_resources(self, repo_manager, temp_cache_dir):
        """Test listing Azure resources."""
        repo_path = temp_cache_dir / 'azure'
        docs_dir = repo_path / 'website' / 'docs' / 'r'
        docs_dir.mkdir(parents=True, exist_ok=True)
        
        # Create fake markdown files
        (docs_dir / 'storage_account.html.markdown').write_text('# azurerm_storage_account')
        (docs_dir / 'virtual_machine.html.markdown').write_text('# azurerm_virtual_machine')
        
        resources = repo_manager.list_all_resources(repo_path)
        
        assert len(resources) == 2
        assert 'azurerm_storage_account' in resources
        assert 'azurerm_virtual_machine' in resources
    
    def test_list_gcp_resources(self, repo_manager, temp_cache_dir):
        """Test listing GCP resources."""
        repo_path = temp_cache_dir / 'gcp'
        docs_dir = repo_path / 'website' / 'docs' / 'r'
        docs_dir.mkdir(parents=True, exist_ok=True)
        
        # Create fake markdown files
        (docs_dir / 'storage_bucket.html.markdown').write_text('# google_storage_bucket')
        (docs_dir / 'compute_instance.html.markdown').write_text('# google_compute_instance')
        
        resources = repo_manager.list_all_resources(repo_path)
        
        assert len(resources) == 2
        assert 'google_storage_bucket' in resources
        assert 'google_compute_instance' in resources
    
    def test_empty_directory(self, repo_manager, temp_cache_dir):
        """Test listing resources from empty directory."""
        repo_path = temp_cache_dir / 'aws'
        docs_dir = repo_path / 'website' / 'docs' / 'r'
        docs_dir.mkdir(parents=True, exist_ok=True)
        
        resources = repo_manager.list_all_resources(repo_path)
        
        assert resources == []
    
    def test_missing_directory(self, repo_manager, temp_cache_dir):
        """Test listing resources when directory doesn't exist."""
        repo_path = temp_cache_dir / 'aws'
        
        resources = repo_manager.list_all_resources(repo_path)
        
        assert resources == []


class TestListResourcesByService:
    """Test filtering resources by service subcategory."""
    
    def test_filter_by_service(self, repo_manager, temp_cache_dir):
        """Test filtering resources by service name."""
        repo_path = temp_cache_dir / 'aws'
        docs_dir = repo_path / 'website' / 'docs' / 'r'
        docs_dir.mkdir(parents=True, exist_ok=True)
        
        # Create S3 resources
        s3_bucket_content = """---
subcategory: "S3 (Simple Storage)"
---
# Resource: aws_s3_bucket
## Argument Reference
* `bucket` - (Optional) The bucket name
"""
        (docs_dir / 's3_bucket.html.markdown').write_text(s3_bucket_content)
        
        s3_acl_content = """---
subcategory: "S3 (Simple Storage)"
---
# Resource: aws_s3_bucket_acl
## Argument Reference
* `bucket` - (Required) The bucket name
"""
        (docs_dir / 's3_bucket_acl.html.markdown').write_text(s3_acl_content)
        
        # Create EC2 resource
        ec2_content = """---
subcategory: "EC2 (Elastic Compute Cloud)"
---
# Resource: aws_instance
## Argument Reference
* `ami` - (Required) The AMI ID
"""
        (docs_dir / 'instance.html.markdown').write_text(ec2_content)
        
        # Filter by S3
        s3_resources = repo_manager.list_resources_by_service(repo_path, 'S3')
        
        assert len(s3_resources) == 2
        assert 'aws_s3_bucket' in s3_resources
        assert 'aws_s3_bucket_acl' in s3_resources
        assert 'aws_instance' not in s3_resources
    
    def test_case_insensitive_matching(self, repo_manager, temp_cache_dir):
        """Test that service matching is case-insensitive."""
        repo_path = temp_cache_dir / 'aws'
        docs_dir = repo_path / 'website' / 'docs' / 'r'
        docs_dir.mkdir(parents=True, exist_ok=True)
        
        content = """---
subcategory: "S3 (Simple Storage)"
---
# Resource: aws_s3_bucket
## Argument Reference
* `bucket` - (Optional) The bucket name
"""
        (docs_dir / 's3_bucket.html.markdown').write_text(content)
        
        # Test different cases
        assert len(repo_manager.list_resources_by_service(repo_path, 's3')) == 1
        assert len(repo_manager.list_resources_by_service(repo_path, 'S3')) == 1
        assert len(repo_manager.list_resources_by_service(repo_path, 'simple storage')) == 1
    
    def test_partial_matching(self, repo_manager, temp_cache_dir):
        """Test that partial service names match."""
        repo_path = temp_cache_dir / 'aws'
        docs_dir = repo_path / 'website' / 'docs' / 'r'
        docs_dir.mkdir(parents=True, exist_ok=True)
        
        content = """---
subcategory: "EC2 (Elastic Compute Cloud)"
---
# Resource: aws_instance
## Argument Reference
* `ami` - (Required) The AMI ID
"""
        (docs_dir / 'instance.html.markdown').write_text(content)
        
        # Test partial matches
        assert len(repo_manager.list_resources_by_service(repo_path, 'EC2')) == 1
        assert len(repo_manager.list_resources_by_service(repo_path, 'Elastic')) == 1
        assert len(repo_manager.list_resources_by_service(repo_path, 'Compute')) == 1
    
    def test_no_matches(self, repo_manager, temp_cache_dir):
        """Test filtering with no matching resources."""
        repo_path = temp_cache_dir / 'aws'
        docs_dir = repo_path / 'website' / 'docs' / 'r'
        docs_dir.mkdir(parents=True, exist_ok=True)
        
        content = """---
subcategory: "S3 (Simple Storage)"
---
# Resource: aws_s3_bucket
## Argument Reference
* `bucket` - (Optional) The bucket name
"""
        (docs_dir / 's3_bucket.html.markdown').write_text(content)
        
        resources = repo_manager.list_resources_by_service(repo_path, 'Lambda')
        
        assert resources == []

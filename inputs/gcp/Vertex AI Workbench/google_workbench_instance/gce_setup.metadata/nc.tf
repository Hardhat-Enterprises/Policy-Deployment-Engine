# Non-compliant — one per scenario; each violates a single metadata key while
# keeping the others compliant so the violation is isolated.
# nc1: scenario 1 — project-wide SSH keys not blocked
resource "google_workbench_instance" "nc1" {
  project  = "my-secure-project"
  name     = "nc1"
  location = "australia-southeast2-a"
  gce_setup {
    metadata = {
      "block-project-ssh-keys"     = "false"
      "idle-timeout-seconds"       = "3600"
      "notebook-disable-downloads" = "true"
      "notebook-disable-root"      = "true"
      "notebook-disable-terminal"  = "true"
    }
  }
}

# nc2: scenario 2 — idle timeout not set
resource "google_workbench_instance" "nc2" {
  project  = "my-secure-project"
  name     = "nc2"
  location = "australia-southeast2-a"
  gce_setup {
    metadata = {
      "block-project-ssh-keys"     = "true"
      "notebook-disable-downloads" = "true"
      "notebook-disable-root"      = "true"
      "notebook-disable-terminal"  = "true"
    }
  }
}

# nc3: scenario 3 — downloads not disabled
resource "google_workbench_instance" "nc3" {
  project  = "my-secure-project"
  name     = "nc3"
  location = "australia-southeast2-a"
  gce_setup {
    metadata = {
      "block-project-ssh-keys"     = "true"
      "idle-timeout-seconds"       = "3600"
      "notebook-disable-downloads" = "false"
      "notebook-disable-root"      = "true"
      "notebook-disable-terminal"  = "true"
    }
  }
}

# nc4: scenario 4 — root access not disabled
resource "google_workbench_instance" "nc4" {
  project  = "my-secure-project"
  name     = "nc4"
  location = "australia-southeast2-a"
  gce_setup {
    metadata = {
      "block-project-ssh-keys"     = "true"
      "idle-timeout-seconds"       = "3600"
      "notebook-disable-downloads" = "true"
      "notebook-disable-root"      = "false"
      "notebook-disable-terminal"  = "true"
    }
  }
}

# nc5: scenario 5 — terminal access not disabled
resource "google_workbench_instance" "nc5" {
  project  = "my-secure-project"
  name     = "nc5"
  location = "australia-southeast2-a"
  gce_setup {
    metadata = {
      "block-project-ssh-keys"     = "true"
      "idle-timeout-seconds"       = "3600"
      "notebook-disable-downloads" = "true"
      "notebook-disable-root"      = "true"
      "notebook-disable-terminal"  = "false"
    }
  }
}

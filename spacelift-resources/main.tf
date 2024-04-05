#Create the necessary stacks
resource "spacelift_stack" "base-infra" {
  administrative               = false
  space_id                     = "argo-demo-01HTN60KD33DFA0JPZJE5ZYSVC"
  branch                       = "main"
  description                  = "This stack creates a VPC and subnet"
  labels                       = ["infracost, argo"]
  name                         = "base-infra"
  project_root                 = "/vpc"
  repository                   = "Spacelift-argo"
  enable_local_preview         = true
  terraform_smart_sanitization = false
  autodeploy        = true
}

resource "spacelift_stack" "k8s-stack" {
  administrative               = false
  space_id                     = "argo-demo-01HTN60KD33DFA0JPZJE5ZYSVC"
  branch                       = "main"
  description                  = "This stack creates cluster"
  labels                       = ["infracost, argo"]
  name                         = "vpc-stack"
  project_root                 = "/k8s"
  repository                   = "Spacelift-argo"
  enable_local_preview         = true
  terraform_smart_sanitization = false
  autodeploy        = true
}

#Create ansible context

resource "spacelift_context" "infracost-context" {
  description = "Context for Terraform-Ansible workflow demo"
  name        = "Ansible context test "
  space_id    = "stack-dependencies-demo-01HES50MW0R4XW1AME0BPP8YVY"
  labels      = ["autoattach:argo"]
}

resource "spacelift_environment_variable" "infracost-key" {
  context_id = spacelift_context.infracost-context.id
  name       = "INFRACOST_API_KEY"
  value      = "ico-moQ3tvUz9bAeJ0jZQbp1eEaG58ubHWzC"
  write_only = true
}
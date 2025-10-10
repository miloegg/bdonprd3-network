locals {
  yaml_files = fileset(path.module, "*.yaml")

  yaml_configs = {
    for file_name in local.yaml_files :
    file_name => yamldecode(file("${path.module}/${file_name}"))
  }

  firewall_rule_collection_groups = merge(
    [
      for policy in local.yaml_configs : policy
    ]...
  )
}



# locals {    
#   policy1_data = yamldecode(file("${path.module}/policy1.yaml"))
#   policy2_data = yamldecode(file("${path.module}/policy2.yaml"))

#   firewall_rule_collection_groups = merge(
#     local.policy1_data,
#     local.policy2_data
#   )
# }

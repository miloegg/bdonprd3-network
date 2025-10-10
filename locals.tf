locals {
  policy1_data = yamldecode(file("${path.module}/policy1.yaml"))
  policy2_data = yamldecode(file("${path.module}/policy2.yaml"))

  firewall_rule_collection_groups = merge(
    local.policy1_data,
    local.policy2_data
  )
}

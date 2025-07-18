# output "firewall_rule_collection_group_id" {
#   value = azurerm_firewall_policy_rule_collection_group.example.id
# }

# output "avm_fwrcg_1_resource_id" {
#   value = module.avm_fwrcg_1.resource_id
# }

output "fw_rule_collection_group_resources" {
  value = { for k, v in module.avm_fwrcg : k => v.resource }
}

output "fw_rule_collection_group_resource_ids" {
  value = { for k, v in module.avm_fwrcg : k => v.resource_id }
}

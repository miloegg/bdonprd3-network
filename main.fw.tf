# resource "azurerm_firewall_policy_rule_collection_group" "example" {
#   name               = "example-fwpolicy-rcg"
#   firewall_policy_id = data.terraform_remote_state.alz_output.outputs.virtual_wan_firewall_policy_ids.primary
#   priority           = 500
#   application_rule_collection {
#     name     = "app_rule_collection1"
#     priority = 500
#     action   = "Deny"
#     rule {
#       name = "app_rule_collection1_rule1"
#       protocols {
#         type = "Http"
#         port = 8081
#       }
#       protocols {
#         type = "Https"
#         port = 443
#       }
#       source_addresses  = ["10.0.0.1"]
#       destination_fqdns = ["*.microsoft.com"]
#     }
#   }

#   network_rule_collection {
#     name     = "network_rule_collection1"
#     priority = 400
#     action   = "Deny"
#     rule {
#       name                  = "network_rule_collection1_rule1"
#       protocols             = ["TCP", "UDP"]
#       source_addresses      = ["10.0.0.1"]
#       destination_addresses = ["192.168.1.1", "192.168.1.2"]
#       destination_ports     = ["80", "1000-2000"]
#     }
#   }
# }

module "avm_fwrcg" {
  for_each                                                          = var.firewall_rule_collection_groups
  source                                                            = "Azure/avm-res-network-firewallpolicy/azurerm//modules/rule_collection_groups"
  version                                                           = "0.3.3"
  firewall_policy_rule_collection_group_firewall_policy_id          = data.terraform_remote_state.alz_output.outputs.virtual_wan_firewall_policy_ids.primary
  firewall_policy_rule_collection_group_name                        = each.value.rule_collection_group_name
  firewall_policy_rule_collection_group_priority                    = each.value.rule_collection_group_priority
  firewall_policy_rule_collection_group_network_rule_collection     = each.value.network_rule_collection
  firewall_policy_rule_collection_group_application_rule_collection = each.value.application_rule_collection
  firewall_policy_rule_collection_group_nat_rule_collection         = each.value.nat_rule_collection
  firewall_policy_rule_collection_group_timeouts                    = each.value.timeouts

}
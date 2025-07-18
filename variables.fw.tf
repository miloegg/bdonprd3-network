/*
variable "firewall_policy_rule_collection_group_firewall_policy_id" {
  type        = string
  description = "(Required) The ID of the Firewall Policy where the Firewall Policy Rule Collection Group should exist. Changing this forces a new Firewall Policy Rule Collection Group to be created."
  nullable    = false
}
*/




variable "firewall_rule_collection_groups" {
  description = "A map of firewall rule collection groups"
  type = map(object({
    rule_collection_group_name     = string
    rule_collection_group_priority = number
    application_rule_collection = optional(list(object({
      action   = string
      name     = string
      priority = number
      rule = list(object({
        description           = optional(string)
        destination_addresses = optional(list(string), [])
        destination_fqdn_tags = optional(list(string), [])
        destination_fqdns     = optional(list(string), [])
        destination_urls      = optional(list(string), [])
        name                  = string
        source_addresses      = optional(list(string), [])
        source_ip_groups      = optional(list(string), [])
        terminate_tls         = optional(bool)
        web_categories        = optional(list(string), [])
        http_headers = optional(list(object({
          name  = string
          value = string
        })))
        protocols = optional(list(object({
          port = number
          type = string
        })))
      }))
    })))
    nat_rule_collection = optional(list(object({
      action   = string
      name     = string
      priority = number
      rule = list(object({
        description         = optional(string)
        destination_address = optional(string)
        destination_ports   = optional(list(string), [])
        name                = string
        protocols           = list(string)
        source_addresses    = optional(list(string), [])
        source_ip_groups    = optional(list(string), [])
        translated_address  = optional(string)
        translated_fqdn     = optional(string)
        translated_port     = number
      }))
    })))
    network_rule_collection = optional(list(object({
      action   = string
      name     = string
      priority = number
      rule = list(object({
        description           = optional(string)
        destination_addresses = optional(list(string), [])
        destination_fqdns     = optional(list(string), [])
        destination_ip_groups = optional(list(string), [])
        destination_ports     = list(string)
        name                  = string
        protocols             = list(string)
        source_addresses      = optional(list(string), [])
        source_ip_groups      = optional(list(string), [])
      }))
    })))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      read   = optional(string)
      update = optional(string)
    }))
  }))
  default = {}
}


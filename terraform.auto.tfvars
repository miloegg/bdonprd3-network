firewall_rule_collection_groups = {
  policy1 = {
    rule_collection_group_name     = "fw-policy-group-1"
    rule_collection_group_priority = 1000

    application_rule_collection = [
      {
        action   = "Allow"
        name     = "app-rule-1"
        priority = 100
        rule = [
          {
            name              = "rule-1"
            description       = "Allow traffic to web servers"
            source_addresses  = ["10.0.0.0/24"]
            destination_fqdns = ["*.example.com"]
            protocols = [
              {
                type = "Http"
                port = 80
              }
            ]
          }
        ]
      }
    ]

    nat_rule_collection = [
      {
        action   = "Dnat"
        name     = "dnat-rule-1"
        priority = 100
        rule = [
          {
            name                = "dnat-rule-1"
            description         = "dnat rule for web server"
            destination_address = "192.168.1.1"
            destination_ports   = ["80"]
            protocols           = ["TCP"]
            source_addresses    = ["0.0.0.0/0"]
            translated_address  = "10.0.1.1"
            translated_port     = 8080
          }
        ]
      }
    ]

    network_rule_collection = [
      {
        action   = "Allow"
        name     = "network-rule-1"
        priority = 300
        rule = [
          {
            name                  = "network-rule-1"
            description           = "Allow traffic from internal network"
            destination_addresses = ["30.0.0.0/24"]
            destination_ports     = ["443"]
            protocols             = ["TCP"]
            source_addresses      = ["10.0.0.0/24"]
          }
        ]
      }
    ]
  }

  policy2 = {
    rule_collection_group_name     = "fw-policy-group-2"
    rule_collection_group_priority = 2000

    application_rule_collection = [
      {
        action   = "Deny"
        name     = "app-rule-2"
        priority = 200
        rule = [
          {
            name             = "rule-2"
            description      = "Block traffic to certain websites"
            destination_urls = ["*.example.com"]
            source_addresses = ["10.0.0.0/24"]
            protocols = [
              {
                type = "Https"
                port = 443
              }
            ]
          }
        ]
      }
    ]

    nat_rule_collection = [
      {
        action   = "Dnat"
        name     = "dnat-rule-2"
        priority = 200
        rule = [
          {
            name                = "dnat-rule-2"
            description         = "dnat rule for https server"
            destination_address = "192.168.2.1"
            destination_ports   = ["443"]
            protocols           = ["TCP"]
            source_addresses    = ["0.0.0.0/0"]
            translated_address  = "192.168.3.1"
            translated_port     = 443
          }
        ]
      }
    ]

    network_rule_collection = [
      {
        action   = "Allow"
        name     = "network-rule-2"
        priority = 400
        rule = [
          {
            name                  = "network-rule-2"
            description           = "Allow network traffic for VPN"
            destination_addresses = ["40.0.0.0/24"]
            destination_ports     = ["22"]
            protocols             = ["TCP"]
            source_addresses      = ["10.1.0.0/24"]
          }
        ]
      }
    ]
  }
}

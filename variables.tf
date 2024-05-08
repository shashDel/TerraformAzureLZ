# Variables for resource group
variable "resource_group_name" {}
variable "rg_location" {}

# Variables for Hub VNet and subnets
variable "hub_vnet_name" {}
variable "hub_vnet_cidr" {
  type = list
}


#Azure Bastion Host variables
variable "bastion_subnet" {
}
variable "bastion_address_prefix" {
}
variable "bastion_pip_name"{
}
variable "bastion_pip_allocation_mthd" {
}
variable "bastion_pip_sku" {
}
variable "az_bastion_host_name" {
}
variable "az_bastion_host_pip_conf" {
}


#Appgateway  with WAF enabled Variables 

# variable "vnet_name" {
# }
# variable "vnet_rg_name" { 
# }
# variable "vnet_location" {
# }
variable "appgw_subnet_name" {
}
variable "appgw_address_prefixes" {
}

variable "app_gw_pip_name" {
}
variable "app_gw_pip_alloc_mthd" {
}
variable "app_gw_pip_sku" {
}
variable "backend_address_pool_name" {
}

variable "frontend_port_name" {
}

variable "frontend_ip_configuration_name" {
}
variable "frontend_ip_configuration_name_private" {}

variable "http_setting_name" {
}

variable "listener_name" {
}

variable "request_routing_rule_name" {
}
variable "app_gw_name" {
}

variable "instance_count" {
}
variable "appgw_ip_config" { 
}
variable "waf_enabled" {
}
variable "firewall_mode" {
}
variable "rule_set_type" {
}
variable "rule_set_version" {
}
variable "http_listener_protocol" { 
}
variable "rqst_rtng_rule_type" {
}
variable "app_gw_sku_name" {
}
variable "app_gw_sku_tier" {
}
variable "gw_ip_conf_name" {
}
variable "frontend_port_no" { 
}
variable "cookie_based_affinity" {
}
variable "bkend_port" {
}
variable "bkend_protocol" {
}
variable "request_timeout" {
}

/*
variable "storage_account_name" {
}
variable "storage_account_rg" {
}
*/

########========Azure Firewall Variables========#######
variable "afw_subnet_address_space" {
}
variable "afw_subnet_name" {
}
variable "afw_pip_name" {
}
variable "afw_allocated-pip_method" {
}
variable "afw_pip_sku" {
}
variable "afw_name" {
}
variable "afw_sku_name" {
}
variable "afw_sku_tier" {
}
variable "afw_ip_configuration_name" {
}
variable "afw_policy_name" {
  
}

variable "afw_policysku" {
  
}

#######========VPN gateway variables========#######
variable "vpn_gw_name" {
}
variable "vpn_gw_pip_name" { 
}
variable "pip_allocation_method" {
}
variable "vpn_gw_type" {
}
variable "vpn_type" {
}
variable "vpn_gw_sku" {
}
variable "enable_active_active" { 
}
variable "enable_bgp" {
}
variable "vpn_gw_generation" {
}
variable "vpn_gw_subnet_name" {
}
variable "vpn_gw_subnet_address_space" {
}
variable "pip_sku" { 
}
###############Local network gateway######################
variable "loc_nw_gw_sn01_name" {
}
variable "loc_nw_gw_sn01_address" {
}
# variable "loc_nw_gw_sn01_address_space" {
# }
variable "vn_gw_conn_namesn01" {
}
variable "vn_gw_conn_typesn01" {
}


# variable "vn_nw_gw_connec_sh_key" {
# }
# variable "egress_nat_rule_name" {
# }
# variable "mode" {
# }


#######========Hub Resource Group Variables==========#######
variable "law_resource_group_name"{}
variable "law_rg_location"{}

#######==========Log Analytics workspace=========#######
variable "law_name" {
  type = string
}
variable "law_sku_name" {
  type = string
}
variable "law_retention_days" {
  type = number
}
variable "law_internet_ingestion_enabled" {
  type = string
}
variable "law_internet_query_enabled" {
  type = string
}

#######==========Storage Account=========#######
variable "lawstorageaccount_name" {
  type = string
}
variable "lawstorage_account_tier" {
    type = string
}
variable "lawstorage_account_replication_type" {
    type = string
}
variable "lawstorage_public_network_access_enabled" {
    type = string
}
variable "lawstorage_allow_nested_items_to_be_public" {
    type = string
}
variable "lawstorage_enable_https_traffic_only" {
    type = string
}

##############Route table#####################
/*
variable "routetablename1" {}
variable "gtw_subnet_address_gtw" {}
variable "gtw_next_hop_type_gtw" {}
variable "subnet_address_gtw" {}
variable "next_hop_ip_address_gtw" {}


# ###############################################
variable "routetablename2" {}
variable "alb_subnet_address_alb" {}
variable "alb_next_hop_type_alb" {}
variable "subnet_address_alb" {}
variable "next_hop_ip_address_alb" {}

# ###############################################

variable "routetablename3" {}
variable "sec_subnet_address_sec" {}
variable "sec_next_hop_type_sec" {}
variable "subnet_address_sec" {}
variable "next_hop_ip_address_sec" {}

# ###############################################
variable "routetablename4" {}
variable "grc_subnet_address_grc" {}
variable "grc_next_hop_type_grc" {}
variable "subnet_address_grc" {}
variable "next_hop_ip_address_grc" {}

# ###############################################
variable "routetablename5" {}
variable "routename1" {}
variable "frw_subnet_address_frw" {}
variable "frw_next_hop_type_frw" {}
variable "subnet_address_frw" {}
variable "next_hop_ip_address_frw" {}

# ###############################################
variable "routetablename6" {}
variable "shr_subnet_address_shr" {}
variable "shr_next_hop_type_shr" {}
variable "subnet_address_shr" {}
variable "next_hop_ip_address_shr" {}

# ###############################################
variable "routetablename7" {}
variable "shr02_subnet_address_shr02" {}
variable "shr02_next_hop_type_shr02" {}
variable "subnet_address_shr02" {}
variable "next_hop_ip_address_shr02" {}

# ###############################################
variable "routetablename8" {}
variable "shr03_subnet_address_shr03" {}
variable "shr03_next_hop_type_shr03" {}
variable "subnet_address_shr03" {}
variable "next_hop_ip_address_shr03" {}
*/
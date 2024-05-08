#######========== HUB Resource Groups ==========########
module "hub_resource_group" {
  source   = "./modules/resource_group"
  name     = var.resource_group_name
  location = var.rg_location
}

#######========== HUB Vnet ==========########
module "hub_vnet" {
  source              = "./modules/vnet"
  name                = var.hub_vnet_name
  address_space       = var.hub_vnet_cidr
  resource_group_name = module.hub_resource_group.name
  location            = module.hub_resource_group.location
}

module "hub_spoke_vnet_peering" {
  source                          = "./modules/vnet_peering"
  hub_vnet_name                   = module.hub_vnet.name
  hub_vnet_rg                     = module.hub_resource_group.name
  hub_vnet_address_space          = ["10.83.0.0/21"]
  hub_vnet_rg_location            = module.hub_resource_group.location
  spoke_vnet_name                 = "AEN-SPK01-VNET-01"
  spoke_vnet_rg                   = "AEN-SPK01-INF-RG0"
  spoke_vnet_address_space        = ["10.83.32.0/24"]
  spoke_vnet_rg_location          = "UAE North"
  remote_vnet_id                  = "/subscriptions/af5392bb-f013-4b3d-a1f9-614f19eddcfd/resourceGroups/AEN-SPK01-INF-RG01/providers/Microsoft.Network/virtualNetworks/AEN-SPK01-VNET-01"
}

#Azure Firewall deployment 

module "azure_firewall" {
  source                   = "./modules/azure_firewall"
  vnet_name                = module.hub_vnet.name
  afw_subnet_name          = var.afw_subnet_name
  afw_subnet_address_space = var.afw_subnet_address_space
  afw_rg_name              = module.hub_resource_group.name
  afw_rg_location          = module.hub_resource_group.location
  afw_pip_name             = var.afw_pip_name
  afw_allocated-pip_method = var.afw_allocated-pip_method
  afw_pip_sku               = var.afw_pip_sku
  afw_name                  = var.afw_name
  afw_sku_name              = var.afw_sku_name
  afw_sku_tier              = var.afw_sku_tier
  afw_ip_configuration_name = var.afw_ip_configuration_name
  afw_policy_name           = var.afw_policy_name
  afw_policysku             = var.afw_policysku
}

#VPN Gateway
module "vpn_gateway" {
  source                          = "./modules/vpn_gateway"
  resource_group_name             = module.hub_resource_group.name
  vpn_gw_subnet_name              = var.vpn_gw_subnet_name
  vpn_gw_rg_name                  = module.hub_resource_group.name
  vpn_gw_vnet_name                = module.hub_vnet.name
  vpn_gw_subnet_address_space     = var.vpn_gw_subnet_address_space
  vpn_gw_pip_name                 = var.vpn_gw_pip_name
  vpn_gw_location                 = module.hub_resource_group.location
  pip_allocation_method           = var.pip_allocation_method
  pip_sku                         = var.pip_sku
  vpn_gw_name                     = var.vpn_gw_name
  vpn_gw_type                     = var.vpn_gw_type
  vpn_type                        = var.vpn_type
  vpn_gw_sku                      = var.vpn_gw_sku 
  enable_active_active            = var.enable_active_active
  enable_bgp                      = var.enable_bgp 
  vpn_gw_generation               = var.vpn_gw_generation

}

# #Local Network Gateway
module "local_network_gateway_sn01" {
  source                          = "./modules/local_network_gateway"
  loc_nw_gw_name                  = var.loc_nw_gw_sn01_name
  loc_nw_gw_address               = var.loc_nw_gw_sn01_address
  loc_nw_location                 = module.hub_resource_group.location
  loc_nw_resourcegroupname        = module.hub_resource_group.name
  vpn_gw_name                     = "AEN-VPN-GTW-SN01"
  vpn_gw_resourcegroupname        = module.hub_resource_group.name
  loc_nw_gw_address_space         = ["10.1.78.0/24", "10.100.44.0/24"]
# ["10.157.9.0/24", "10.201.12.0/24", 
# "10.202.12.0/24", "10.203.12.0/24", "10.21.0.0/16", "10.216.0.0/16", "10.25.0.0/16",
# "10.25.70.0/23", "10.25.74.0/24", "10.30.0.0/24", "10.30.2.0/24", "10.32.0.0/11",
# "10.34.50.0/24", "10.36.60.0/24", "10.38.0.0/16", "10.41.2.0/24", "10.42.0.0/16", 
# "10.43.16.0/21", "10.43.68.0/23", "10.43.68.0/24", "10.43.72.0/24", "10.43.74.0/23", 
# "10.44.2.0/24", "10.44.87.0/24", "10.46.13.0/24", "10.46.2.0/24", "10.56.21.0/24", 
# "10.58.1.0/24", "10.62.16.0/24", "10.62.23.0/24", "10.62.24.103/32", "10.62.32.0/24",
# "10.73.16.0/21", "10.73.68.0/23", "10.73.72.0/24", "10.79.0.192/26", "10.79.1.0/24", "10.79.4.0/24",
# "172.21.155.0/24", "172.22.0.0/16", "172.22.104.0/24", "172.22.106.0/24", "172.22.111.0/24",
# "172.22.112.0/24", "172.22.113.0/24", "172.22.114.0/24", "172.22.115.0/24", "172.22.116.0/24",
# "172.22.117.0/24", "172.22.118.0/23", "172.22.152.0/24", "172.22.154.0/24", "172.22.155.192/26", 
# "172.24.0.0/16", "172.24.160.0/22", "172.24.176.0/20", "172.24.32.0/22", "172.24.33.0/24", 
# "172.24.48.0/20", "172.24.59.0/24", "172.26.0.0/16", "192.168.33.20/32"]
  vn_gw_conn_name                 = var.vn_gw_conn_namesn01
  vn_gw_conn_type                 = var.vn_gw_conn_typesn01
  vpn_gw_location                 = module.hub_resource_group.location
  virtual_network_gateway_id      = module.vpn_gateway.id
  vpn_gw_rg_name                  = module.hub_resource_group.name
  # type                            = var.connection_type
  # vn_nw_gw_connec_sh_key          = var.vn_nw_gw_connec_sh_key
  # egress_nat_rule_name            = var.egress_nat_rule_name
  # mode                            = var.mode

depends_on = [ module.vpn_gateway ]
}


#Azure Bastion Host Module
module "bastionhost"{
  source                          = "./modules/azure_bastion"
  bastion_subnet                  = var.bastion_subnet
  bastion_rg_name                 = module.hub_resource_group.name
  vnet_name                       = module.hub_vnet.name
  bastion_pip_location            = module.hub_resource_group.location
  bastion_address_prefix          = var.bastion_address_prefix
  bastion_pip_name                = var.bastion_pip_name
  bastion_pip_allocation_mthd     = var.bastion_pip_allocation_mthd
  bastion_pip_sku                 = var.bastion_pip_sku
  az_bastion_host_name            = var.az_bastion_host_name
  az_bastion_host_pip_conf         = var.az_bastion_host_pip_conf
}
// # # DC
// # module "domain_controllers" {
// #   source                          = "./modules/domain_controllers"
// #   dc_subnet_name                  = var.dc_subnet_name
// #   resource_group_name             = module.rg.name
// #   virtual_network_name            = module.hub_vnet.name
// #   dc_subnet_address_prefixes      = var.dc_subnet_address_prefixes
// # }


#Appgateway with WAF enabled 
module "application_gateway" {
  source                          = "./modules/application_gateway"
  vnet_name                       = module.hub_vnet.name
  vnet_rg_name                    = module.hub_resource_group.name
  vnet_location                   = module.hub_resource_group.location 
  appgw_subnet_name               = var.appgw_subnet_name 
  appgw_address_prefixes          = var.appgw_address_prefixes
  app_gw_pip_name                 = var.app_gw_pip_name
  app_gw_pip_alloc_mthd           = var.app_gw_pip_alloc_mthd
  app_gw_pip_sku                  = var.pip_sku
  backend_address_pool_name       = var.backend_address_pool_name 
  frontend_port_name              = var.frontend_port_name  
  frontend_ip_configuration_name  = var.frontend_ip_configuration_name
  frontend_ip_configuration_name_private = var.frontend_ip_configuration_name_private
  http_setting_name               = var.http_setting_name
  listener_name                   = var.listener_name   
  request_routing_rule_name       = var.request_routing_rule_name
  app_gw_name                     = var.app_gw_name
  instance_count                  = var.instance_count
  appgw_ip_config                 = var.appgw_ip_config 
  waf_enabled                     = var.waf_enabled
  firewall_mode                   = var.firewall_mode
  rule_set_type                   = var.rule_set_type
  rule_set_version                = var.rule_set_version
  http_listener_protocol          = var.http_listener_protocol
  rqst_rtng_rule_type             = var.rqst_rtng_rule_type
  app_gw_sku_name                 = var.app_gw_sku_name
  app_gw_sku_tier                 = var.app_gw_sku_tier
  gw_ip_conf_name                 = var.gw_ip_conf_name
  frontend_port_no                = var.frontend_port_no
  cookie_based_affinity           = var.cookie_based_affinity
  bkend_port                      = var.bkend_port
  bkend_protocol                  = var.bkend_protocol
  request_timeout                 = var.request_timeout
  /*
  storage_account_name            = var.storage_account_name
  storage_account_rg              = var.storage_account_rg
  */
  
  
}

###############################################


module "loganalytics_resource_group" {
  source   = "./modules/resource_group"
  name     = var.law_resource_group_name
  location = var.law_rg_location
}

##########################################

module "log_analytics_workspace" {
source                = "./modules/log_analytics_workspace"
 law_name              = var.law_name
 law_rg_location       = module.loganalytics_resource_group.location
 law_rg_name           = module.loganalytics_resource_group.name
 law_sku_name          = var.law_sku_name
 law_retention_days    = var.law_retention_days
 law_internet_ingestion_enabled = var.law_internet_ingestion_enabled
 law_internet_query_enabled     = var.law_internet_query_enabled
}


#######========= Log_analaytics_workspace Storage Account ==========########
module "storageaccount_law" {
  source              = "./modules/storage_account"
  law_storage_name     = var.lawstorageaccount_name
  law_storage_rgname   = module.loganalytics_resource_group.name
  law_storage_location = module.loganalytics_resource_group.location
  law_storage_account_tier                    = var.lawstorage_account_tier
  law_storage_account_replication_type        = var.lawstorage_account_replication_type
  law_storage_public_network_access_enabled   = var.lawstorage_public_network_access_enabled
  law_storage_allow_nested_items_to_be_public = var.lawstorage_allow_nested_items_to_be_public
  law_storage_enable_https_traffic_only       = var.lawstorage_enable_https_traffic_only

}

#############Route table######################

/*module "route_table_gtw" {
    source                  = "./modules/route_table"
    routetablename          = var.routetablename1
    route_tbl_rg_location   = module.hub_resource_group.location
    route_tbl_rg_name       = module.hub_resource_group.name
    routename               = ""
    routesubnet_address     = var.gtw_subnet_address_gtw
    next_hop_type           = var.gtw_next_hop_type_gtw
    subnet_address_of_route = var.subnet_address_gtw
    route_table_id          = "/subscriptions/cc23735f-cee0-4ebd-b4c0-21525999890d/resourceGroups/AEN-HUB-INF-RG01/providers/Microsoft.Network/routeTables/AEN-HUB-UDR-GTW"
    next_hop_ip_address     = var.next_hop_ip_address_gtw
}

# ##############Route table######################

module "route_table_alb" {
    source                  = "./modules/route_table"
    routetablename          = var.routetablename2
    route_tbl_rg_location   = module.hub_resource_group.location
    route_tbl_rg_name       = module.hub_resource_group.name
#     route_tbl_rg_name       = module.hub_resource_group.name
    routename               = ""
    routesubnet_address     = var.alb_subnet_address_alb
    next_hop_type           = var.alb_next_hop_type_alb
    subnet_address_of_route = var.subnet_address_alb
    route_table_id          = "/subscriptions/cc23735f-cee0-4ebd-b4c0-21525999890d/resourceGroups/AEN-HUB-INF-RG01/providers/Microsoft.Network/routeTables/AEN-HUB-UDR-ALB02"
    next_hop_ip_address     = var.next_hop_ip_address_alb
}

# ##############Route table######################

module "route_table_sec" {
    source                  = "./modules/route_table"
    routetablename          = var.routetablename3
    route_tbl_rg_location   = module.hub_resource_group.location
    route_tbl_rg_name       = module.hub_resource_group.name
    routename               = ""
    routesubnet_address     = var.sec_subnet_address_sec
    next_hop_type           = var.sec_next_hop_type_sec
    subnet_address_of_route = var.subnet_address_sec
    route_table_id          = "/subscriptions/cc23735f-cee0-4ebd-b4c0-21525999890d/resourceGroups/AEN-HUB-INF-RG01/providers/Microsoft.Network/routeTables/AEN-HUB-UDR-SEC"
    next_hop_ip_address     = var.next_hop_ip_address_sec
}

# ##############Route table######################

module "route_table_grc" {
    source                  = "./modules/route_table"
    routetablename          = var.routetablename4
    route_tbl_rg_location   = module.hub_resource_group.location
    route_tbl_rg_name       = module.hub_resource_group.name
    routename               = ""
    routesubnet_address     = var.grc_subnet_address_grc
    next_hop_type           = var.grc_next_hop_type_grc
    subnet_address_of_route = var.subnet_address_grc
    route_table_id          = "/subscriptions/cc23735f-cee0-4ebd-b4c0-21525999890d/resourceGroups/AEN-HUB-INF-RG01/providers/Microsoft.Network/routeTables/AEN-SPK3-UDR-GRC-001"
    next_hop_ip_address     = var.next_hop_ip_address_grc
}

# ##############Route table######################

module "route_table_frw" {
    source                  = "./modules/route_table"
    routetablename          = var.routetablename5
    route_tbl_rg_location   = module.hub_resource_group.location
    route_tbl_rg_name       = module.hub_resource_group.name
    routename               = var.routename1
    routesubnet_address     = var.frw_subnet_address_frw
    next_hop_type           = var.frw_next_hop_type_frw
    subnet_address_of_route = "/subscriptions/cc23735f-cee0-4ebd-b4c0-21525999890d/resourceGroups/AEN-HUB-INF-RG01/providers/Microsoft.Network/virtualNetworks/AEN-HUB-VNET-01/subnets/AzureFirewallSubnet"
    route_table_id          = "/subscriptions/cc23735f-cee0-4ebd-b4c0-21525999890d/resourceGroups/AEN-HUB-INF-RG01/providers/Microsoft.Network/routeTables/AEN-HUB-UDR-FRW"
    next_hop_ip_address     = var.next_hop_ip_address_frw
    // routename1               = "Route-To-Internet"
    // routesubnet_address1     = "0.0.0.0/0"
    // next_hop_type1           = "Virtual appliance"
    // next_hop_ip_address1     = "10.83.0.68"
}

# ##############Route table######################

module "route_table_shr" {
    source                  = "./modules/route_table"
    routetablename          = var.routetablename6
    route_tbl_rg_location   = module.hub_resource_group.location
    route_tbl_rg_name       = module.hub_resource_group.name
    routename               = ""
    routesubnet_address     = var.shr_subnet_address_shr
    next_hop_type           = var.shr_next_hop_type_shr
    subnet_address_of_route = var.subnet_address_shr
    route_table_id          = "/subscriptions/cc23735f-cee0-4ebd-b4c0-21525999890d/resourceGroups/AEN-HUB-INF-RG01/providers/Microsoft.Network/routeTables/AEN-HUB-UDR-SHR"
    next_hop_ip_address     = var.next_hop_ip_address_shr
}

# ##############Route table######################

module "route_table_shr02" {
    source                  = "./modules/route_table"
    routetablename          = var.routetablename7
    route_tbl_rg_location   = module.hub_resource_group.location
    route_tbl_rg_name       = module.hub_resource_group.name
    routename               = ""
    routesubnet_address     = var.shr02_subnet_address_shr02
    next_hop_type           = var.shr02_next_hop_type_shr02
    subnet_address_of_route = var.subnet_address_shr02
    route_table_id          = "/subscriptions/cc23735f-cee0-4ebd-b4c0-21525999890d/resourceGroups/AEN-HUB-INF-RG01/providers/Microsoft.Network/routeTables/AEN-HUB-UDR-SHR02"
    next_hop_ip_address     = var.next_hop_ip_address_shr02
}

# ##############Route table######################

module "route_table_shr03" {
    source                  = "./modules/route_table"
    routetablename          = var.routetablename8
    route_tbl_rg_location   = module.hub_resource_group.location
    route_tbl_rg_name       = module.hub_resource_group.name
    routename               = ""
    routesubnet_address     = var.shr03_subnet_address_shr03
    next_hop_type           = var.shr03_next_hop_type_shr03
    subnet_address_of_route = var.subnet_address_shr03
    route_table_id          = "/subscriptions/cc23735f-cee0-4ebd-b4c0-21525999890d/resourceGroups/AEN-HUB-INF-RG01/providers/Microsoft.Network/routeTables/AEN-HUB-UDR-SHR03"
    next_hop_ip_address     = var.next_hop_ip_address_shr03
}
*/

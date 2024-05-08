
#######========Hub Resource Group Variables==========#######
resource_group_name   = "AEN-HUB-INF-RG01"
rg_location           = "UAE North"

#######========Hub VNET Variables==========#######
hub_vnet_name             = "AEN-HUB-VNET-01"
hub_vnet_cidr             = ["10.83.0.0/21"]

#######========Azure Firewall Variables==========#######
afw_subnet_name           = "AzureFirewallSubnet"
afw_subnet_address_space  = ["10.83.0.64/26"]
afw_pip_name              = "AEN-HUB-FRW-IP01"
afw_allocated-pip_method  = "Static"
afw_pip_sku               = "Standard"
afw_name                  = "AEN-HUB-FRW-01"
afw_sku_name              = "AZFW_VNet"
afw_sku_tier              = "Premium"
afw_ip_configuration_name = "afw-ip-configuration"
afw_policy_name           =  "AEN-HUB-FRW-PLC"
afw_policysku             =  "Premium"


#######========VPN gateway variables========#######
vpn_gw_name                 = "AEN-VPN-GTW-SN01"
vpn_gw_pip_name             = "AEN-VPN-GTW-IP01"
pip_allocation_method       = "Static"
pip_sku                     = "Standard"
vpn_gw_type                 = "Vpn"
vpn_type                    = "RouteBased"
vpn_gw_sku                  = "VpnGw1"
enable_active_active        = "false"
enable_bgp                  = "false"
vpn_gw_generation           = "Generation1"
vpn_gw_subnet_name          = "GatewaySubnet"
vpn_gw_subnet_address_space = ["10.83.0.0/26"]

# ########################Local network gateway###########################################
loc_nw_gw_sn01_name              = "AEN-VPN-LGW-SN01"
loc_nw_gw_sn01_address           = "94.56.95.86"
# loc_nw_gw_sn01_address_space     = [""]
vn_gw_conn_namesn01                 = "AEN-VPN-IDC01"
vn_gw_conn_typesn01               =   "IPsec"
# vn_nw_gw_connec_sh_key      = ""
# egress_nat_rule_name        = "vpngwnatrule"
# mode                        = "EgressSnat"


#Azure Bastion Host Variables
bastion_subnet                  = "AzureBastionSubnet" 
bastion_address_prefix          = ["10.83.0.128/26"]
bastion_pip_name                = "AEN-HUB-BASTION-IP01"
bastion_pip_allocation_mthd     = "Static"
bastion_pip_sku                 = "Standard"
az_bastion_host_name            = "AEN-HUB-BASTION-01"
az_bastion_host_pip_conf        = "bastionipconfig"

#Appgateway  with WAF enabled Variables 

appgw_subnet_name      = "AEN-SNET-INF-ALB-01"
appgw_address_prefixes = ["10.83.0.208/28"]
app_gw_name              = "AEN3VSPAGW01"
instance_count           = "2"
appgw_ip_config          = "appgw-ip-config"
app_gw_pip_name          = "AEN-HUB-AGW3-IP01"
app_gw_pip_alloc_mthd    = "Static"
app_gw_pip_sku           = "Standard"
backend_address_pool_name= "SPK01-BKN-POOL-01"
frontend_port_name       = "appGwPublicFrontendport"
frontend_ip_configuration_name = "appGwPublicFrontendIp"
frontend_ip_configuration_name_private = "appGwPrivateFrontendIp"
http_setting_name        = "SPK01-BKN-SET-001"
listener_name            = "SPK01-LSN-01"
request_routing_rule_name= "SPK01-RTE-RULE-01"
waf_enabled              = true
firewall_mode            = "Prevention"
rule_set_type            = "OWASP"
rule_set_version         = "3.2"
http_listener_protocol   = "Http"
rqst_rtng_rule_type      = "Basic"
app_gw_sku_name          = "WAF_v2"
app_gw_sku_tier          = "WAF_v2"
gw_ip_conf_name          = "my-gateway-ip-configuration"
frontend_port_no         = 80
cookie_based_affinity    = "Disabled"
bkend_port               = 80
bkend_protocol           = "Http"
request_timeout          = 60
/*
storage_account_name     = "testrituaz"
storage_account_rg       = "AZ-TEST-RG"
*/

# #######========Domain Controller Variables==========#######
# dc_subnet_name                        = "ADSubnet"
# dc_subnet_address_prefixes            = []

#######========law Resource Group Variables==========#######
law_resource_group_name   = "AEN-DATALOAD-MONITOR-RG01"
law_rg_location          = "UAE North"


#######========== Log_Analytics_Workspace Variables ==========#######
law_name          = "AEN-LAWORKSPACE-01"
law_sku_name          = "PerGB2018"
law_retention_days    = "90"
law_internet_query_enabled = "false"
law_internet_ingestion_enabled = "false"


#######==========Storage Account========#######
lawstorageaccount_name   = "aenlaworkspacestrac01"
lawstorage_account_tier  = "Standard"
lawstorage_account_replication_type        = "LRS"
lawstorage_public_network_access_enabled   = "false"
lawstorage_allow_nested_items_to_be_public = "false"
lawstorage_enable_https_traffic_only       = "true"

##################Route table#######################
/*
routetablename1 = "AEN-HUB-UDR-GTW"
gtw_subnet_address_gtw = ""
gtw_next_hop_type_gtw  = ""
subnet_address_gtw    = ""
next_hop_ip_address_gtw = ""

# ########################################################

routetablename2 = "AEN-HUB-UDR-ALB02"
alb_subnet_address_alb = ""
alb_next_hop_type_alb  = ""
subnet_address_alb    = ""
next_hop_ip_address_alb = ""

# ########################################################

routetablename3 = "AEN-HUB-UDR-SEC"
sec_subnet_address_sec = ""
sec_next_hop_type_sec  = ""
subnet_address_sec     = ""
next_hop_ip_address_sec = ""

# ########################################################
routetablename4 = "AEN-SPK3-UDR-GRC-001"
grc_subnet_address_grc = ""
grc_next_hop_type_grc  = ""
subnet_address_grc    = ""
next_hop_ip_address_grc = ""

# ########################################################
routetablename5 = "AEN-HUB-UDR-FRW"
routename1      =  "Route-To-AEN-GRC-01"
frw_subnet_address_frw = "10.53.32.0/24"
frw_next_hop_type_frw = "VirtualAppliance"
subnet_address_frw    = "10.83.0.64/26"
next_hop_ip_address_frw = "10.53.0.68"

# ########################################################

routetablename6 = "AEN-HUB-UDR-SHR"
shr_subnet_address_shr = ""
shr_next_hop_type_shr = ""
subnet_address_shr   = ""
next_hop_ip_address_shr = ""

# ########################################################
routetablename7 = "AEN-HUB-UDR-SHR02"
shr02_subnet_address_shr02 = ""
shr02_next_hop_type_shr02 = ""
subnet_address_shr02        =  ""
next_hop_ip_address_shr02    =  ""

# ########################################################

routetablename8 = "AEN-HUB-UDR-SHR03"
shr03_subnet_address_shr03 = ""
shr03_next_hop_type_shr03 = ""
subnet_address_shr03       = ""
next_hop_ip_address_shr03    = ""

*/
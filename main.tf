resource "azurerm_resource_group" "ranjeet-rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  location            = azurerm_resource_group.ranjeet-rg.location
  resource_group_name = azurerm_resource_group.ranjeet-rg.name
  address_space       = var.vnet_address_space
}

resource "azurerm_subnet" "appgw_subnet" {
  name                 = var.subnet_name
  resource_group_name  = azurerm_resource_group.ranjeet-rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.subnet_prefix
}

resource "azurerm_public_ip" "pip" {
  name                = var.public_ip_name
  location            = azurerm_resource_group.ranjeet-rg.location
  resource_group_name = azurerm_resource_group.ranjeet-rg.name

  allocation_method = "Static"
  sku               = "Standard"
}

resource "azurerm_application_gateway" "appgw" {
  name                = var.app_gateway_name
  resource_group_name = azurerm_resource_group.ranjeet-rg.name
  location            = azurerm_resource_group.ranjeet-rg.location

  sku {
    name     = "Standard_v2"
    tier     = "Standard_v2"
    capacity = 2
  }

  gateway_ip_configuration {
    name      = "gateway-ip-config"
    subnet_id = azurerm_subnet.appgw_subnet.id
  }

  frontend_port {
    name = "frontend-port"
    port = 80
  }

  frontend_ip_configuration {
    name                 = "frontend-ip"
    public_ip_address_id = azurerm_public_ip.pip.id
  }

  backend_address_pool {
    name = "backend-pool"
  }

  backend_http_settings {
    name                  = "backend-http-setting"
    cookie_based_affinity = "Disabled"
    port                  = 80
    protocol              = "Http"
    request_timeout       = 60
  }

  http_listener {
    name                           = "listener"
    frontend_ip_configuration_name = "frontend-ip"
    frontend_port_name             = "frontend-port"
    protocol                       = "Http"
  }

  request_routing_rule {
    name                       = "routing-rule"
    rule_type                  = "Basic"
    http_listener_name         = "listener"
    backend_address_pool_name  = "backend-pool"
    backend_http_settings_name = "backend-http-setting"
    priority                   = 100
  }
}
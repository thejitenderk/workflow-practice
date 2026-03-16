# ─── RESOURCE GROUPS ───
resource_groups = {
  "rg-dev-ci" = {
    location = "centralindia"
  }
}

# ─── VNETS with SUBNETS ───
vnets = {
  "vnet-dev-ci" = {
    resource_group_name = "rg-dev-ci"
    location            = "centralindia"
    address_space       = ["10.0.0.0/16"]
    subnets = [
      {
        name             = "snet-web"
        address_prefixes = ["10.0.1.0/24"]
      },
      {
        name             = "snet-app"
        address_prefixes = ["10.0.2.0/24"]
      }
    ]
  }
}

# ─── NSGs ───
nsgs = {
  "nsg-dev" = {
    resource_group_name = "rg-dev-ci"
    location            = "centralindia"
    security_rules = [
      {
        name                       = "allow-rdp"
        priority                   = 100
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "3389"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      },
      {
        name                       = "allow-winrmsec"
        priority                   = 110
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "5986"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      },
      {
        name                       = "allow-winrm"
        priority                   = 120
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "5985"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      }
    ]
  }
}

# ─── NSG <-> SUBNET ASSOCIATIONS ───
nsgassoc = {
  "dev-web-nsg-assoc" = {
    subnet_name          = "snet-web"
    nsgname              = "nsg-dev"
    virtual_network_name = "vnet-dev-ci"
    resource_group_name  = "rg-dev-ci"
  }
  "dev-app-nsg-assoc" = {
    subnet_name          = "snet-app"
    nsgname              = "nsg-dev"
    virtual_network_name = "vnet-dev-ci"
    resource_group_name  = "rg-dev-ci"
  }

}

# ─── LINUX VMs ───
windowsvm = {
  "vm-dev-web-01" = {
    resource_group_name  = "rg-dev-ci"
    location             = "centralindia"
    virtual_network_name = "vnet-dev-ci"
    subnet_name          = "snet-web"
    vm_size              = "Standard_D2s_v3"
    admin_username       = "azureadmin"
    admin_password       = "Welcome$1234"

  }
  "vm-dev-app-01" = {
    resource_group_name  = "rg-dev-ci"
    location             = "centralindia"
    virtual_network_name = "vnet-dev-ci"
    subnet_name          = "snet-app"
    vm_size              = "Standard_D2s_v3"
    admin_username       = "azureadmin"
    admin_password       = "Welcome$1234"
  }
}

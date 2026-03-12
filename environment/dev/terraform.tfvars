# ─── RESOURCE GROUPS ───
resource_groups = {
  "rg-dev-uks" = {
    location = "UK South"
  }
}

# ─── VNETS with SUBNETS ───
vnets = {
  "vnet-dev-uks" = {
    resource_group_name = "rg-dev-uks"
    location            = "UK South"
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
    resource_group_name = "rg-dev-uks"
    location            = "UK South"
    security_rules = [
      {
        name                       = "allow-ssh"
        priority                   = 100
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      },
      {
        name                       = "allow-http"
        priority                   = 110
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "80"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      },
      {
        name                       = "allow-https"
        priority                   = 120
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "443"
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
    virtual_network_name = "vnet-dev-uks"
    resource_group_name  = "rg-dev-uks"
  }
  "dev-app-nsg-assoc" = {
    subnet_name          = "snet-app"
    nsgname              = "nsg-dev"
    virtual_network_name = "vnet-dev-uks"
    resource_group_name  = "rg-dev-uks"
  }

}

# ─── LINUX VMs ───
linux_vms = {
  "vm-dev-web-01" = {
    resource_group_name  = "rg-dev-uks"
    virtual_network_name = "vnet-dev-uks"
    subnet_name          = "snet-web"
    vm_size              = "Standard_DC1ds_v3"
    admin_username       = "azureadmin"
    admin_password       = "Welcome$1234"

  }
  "vm-dev-app-01" = {
    resource_group_name = "rg-prod-uks"
    virtual_network_name           = "vnet-prod-uks"
    subnet_name        = "snet-app"
    vm_size            = "Standard_DC1ds_v3"
    admin_username     = "azureuser"
    admin_password     = "Welcome$1234"

  }
}

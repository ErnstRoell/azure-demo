###############################################
##### Dev
###############################################

resource "azurerm_key_vault_access_policy" "dev" {
  key_vault_id = azurerm_key_vault.dev.id
  tenant_id = azurerm_data_factory.dev.identity[0].tenant_id
  object_id = azurerm_data_factory.dev.identity[0].principal_id
  secret_permissions = ["delete", "get", "list", "set"]
  storage_permissions = ["Get"]
  }


resource "azurerm_key_vault_secret" "dev" {
  name         = "storage-cs"
  value        = azurerm_storage_account.dev.primary_connection_string
  key_vault_id = azurerm_key_vault.dev.id
}


###############################################
##### Test
###############################################

resource "azurerm_key_vault_access_policy" "test" {
  key_vault_id = azurerm_key_vault.test.id
  tenant_id = azurerm_data_factory.test.identity[0].tenant_id
  object_id = azurerm_data_factory.test.identity[0].principal_id
  secret_permissions = ["Delete", "get", "list", "set"]
  storage_permissions = ["Get"]
  }




resource "azurerm_key_vault_secret" "test" {
  name         = "storage-cs"
  value        = azurerm_storage_account.test.primary_connection_string
  key_vault_id = azurerm_key_vault.test.id
}

###############################################
##### Prod
###############################################

resource "azurerm_key_vault_access_policy" "prod" {
  key_vault_id = azurerm_key_vault.prod.id
  tenant_id = azurerm_data_factory.prod.identity[0].tenant_id
  object_id = azurerm_data_factory.prod.identity[0].principal_id
  secret_permissions = ["Delete", "get", "list", "set"]
  storage_permissions = ["Get"]
  }


resource "azurerm_key_vault_secret" "prod" {
  name         = "storage-cs"
  value        = azurerm_storage_account.prod.primary_connection_string
  key_vault_id = azurerm_key_vault.prod.id
}

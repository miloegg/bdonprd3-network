### Requirements 

- use same storage account as alz bootstrap but different tfstate file
- since runners in bootstrap are repository-level runners, require new runner for this and this has to be in the same virtual network as the storage account containing tfstate
- the new runner has to be given permissions to access the storage account
# Terraform Q&A

## How to convert or add the manually provisioned infrastructure in the aws console to the terraform files
1. Desired state and the current states in the state file will be different in that case
2. we have to manually go to the each resource in the aws and have to build the terraform configuration files for each resources that are created and then we have to update them, so the terraform state file will also be updated
3. so then the manually created and the current state of the terraform everything will be under the terraform

## How to have terraform import all of the "already exists" resources automatically from azure?
If you are looking to import Azure resources then aztfy is the recommended tool as it is natively from Azure. It does generate the terraform code, additionally, it has a feature where you can import the azure resource group, it automatically imports and generates config for the resources that the resource group is holding.
aztfy tool: https://github.com/Azure/aztfexport

## what is terraform import?
I need to run `terraform import` to import the resource to my worksapce. The problem is that I need to specify the resource id for all of the missing resources one at a time.
https://developer.hashicorp.com/terraform/tutorials/state/state-import?utm_source=WEBSITE&utm_medium=WEB_IO&utm_offer=ARTICLE_PAGE&utm_content=DOCS



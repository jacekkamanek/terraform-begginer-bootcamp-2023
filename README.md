# Terraform Beginner Bootcamp 2023

## Semantic Versioning 

Semantic Versioning 2.0.0
Summary

Given a version number MAJOR.MINOR.PATCH, increment the:

   - **MAJOR** version when you make incompatible API changes
   - **MINOR** version when you add functionality in a backward compatible manner
   - **PATCH** version when you make backward compatible bug fixes

Additional labels for pre-release and build metadata are available as extensions to the MAJOR.MINOR.PATCH format.


### AWS CLI INSTALLATION

AWS CLI is installed for this project via the bash ['script /.bin/install_aws_cli'](/workspace/terraform-begginer-bootcamp-2023/.bin/install_aws_cli)

We can check if are logged in or not
```sh
aws sts get-caller-identity
```


If it is succesful you should see a json payload return that looks like this:

```json
> aws sts get-caller-identity
{
    "UserId": "208832880636",
    "Account": "2088828588836",
    "Arn": "arn:aws:iam::777777507736:root"
}
```

### Terraform providers ###

``` This is the website you need to for your terraform providers config (https://registry.terraform.io/)```

Basically **modules** are templates for our enviroment (ex VPC template)

**providers** is an interface to APIs that will allow to create resources in terraform.

### Terraform State Files

'.terraform.tfstate' contains information about the current state of your infrastracture.

This file **should not be commited to Version Control System eg. github!!**
This file can contain sensetive data, '.terraform.tfstate.backup' --> previous state file. 

### Terraform Directory

'.terraform' directory contains binaries of terraform providers. 

## Setting Alias in .bash

If u want to add alias, open ~/.bash_profile and add "alias tf="terraform" or add a script so u dont have to do it all over again. 



## Project_Root

Project_Root
|
|-- [ ] variables.tf - stores the structure of input variables
|
|-- [ ] main.tf - everything else
|
|-- [ ] providers.tf - defined required providers and their config
|
|-- [ ] outputs.tf - stores our outputs
|
|-- [ ] terraform.tfvars - data of variables we want to load into our terraform project
|
|-- [ ] README.md - required for root modules

## Terraform Cloud variables

1. Enviroment variables = setting in bash terminal eg. AWS credentials.

2. Terraform Variables = those we set in tfvars file.

## Terraform.tfvars

This is the default file to load in tf variables in bulk.

### Fixing manual config/ config drift

When some1 deletes or modifies remote/cloud resources manually through 'ClickOPS'. We can run "terraform plan" to detect config drift and replace missing resources. 

### Loosing state file in terraform

When we loose our state file, we most likely hava to tear down all cloud infrastructure manually. ## Terraform Import ## does not work on all resources, we need to check it on providers site.

### Terraform module Sources
The module installer supports installation from a number of different source types.

    Local paths
    Terraform Registry
    GitHub
    Bitbucket
    Generic Git, Mercurial repositories
    HTTP URLs
    S3 buckets
    GCS buckets
    Modules in Package Sub-directories

    eg. (local paths)
    ```terraform
    module "terrahouse_aws" {
  source = "./modules/terraform_aws"
  useruuid = " "
}
   ```


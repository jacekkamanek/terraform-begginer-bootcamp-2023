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





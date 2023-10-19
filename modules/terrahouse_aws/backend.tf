# terraform {
#   backend "remote" {
#     hostname = "app.terraform.io"
#     organization = "janekkamanek"

#     workspaces {
#       name = "asda"
#     }
#     cloud {
#         organization = "janekkamanek"
#         workspaces {
#             name = "asda"
#         }
#     }
    
#   }
# }
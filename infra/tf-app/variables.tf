variable "resource_group_name" {
  type        = string
  description = "The name of the resource group"
  default     = "cst8918-final-project-group-10"
}

variable "resource_group_location" {
  type        = string
  description = "The Azure region for the resource group"
  default     = "canadacentral"
}

variable "group_number" {
  type        = string
  description = "The group number"
  default     = "10"
}

variable "tags" {

  type        = map(string)
  description = "The tags for the resource group"
  default     = {
    "Cost Center" = "000"
  }
}


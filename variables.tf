## GLOBAL VAR CONFIGURATION
variable "aws_region" {
  description = "Region for the VPC"
}

variable "map_accounts" {
  description = "Additional AWS account numbers to add to the aws-auth configmap."
  type        = list(string)

  default = []
  # default = [
  #   "777777777777",
  #   "888888888888",
  # ]
}

variable "map_roles" {
  description = "Additional IAM roles to add to the aws-auth configmap."
  type = list(object({
    rolearn  = string
    username = string
    groups   = list(string)
  }))

  default = []
  # default = [
  #   {
  #     rolearn  = "arn:aws:iam::66666666666:role/role1"
  #     username = "role1"
  #     groups   = ["system:masters"]
  #   },
  # ]
}

variable "map_users" {
  description = "Additional IAM users to add to the aws-auth configmap."
  type = list(object({
    userarn  = string
    username = string
    groups   = list(string)
  }))

  default = []
  # default = [
  #   {
  #     userarn  = "arn:aws:iam::66666666666:user/user1"
  #     username = "user1"
  #     groups   = ["system:masters"]
  #   },
  #   {
  #     userarn  = "arn:aws:iam::66666666666:user/user2"
  #     username = "user2"
  #     groups   = ["system:masters"]
  #   },
  # ]
}

variable "root_domain_name" {
  description = "Domain root where all kubernetes systems are orchestrating control"
}

variable "app_name" {
  description = "Application Name"
  default     = "eks"
}

variable "app_namespace" {
  description = "Tagged App Namespace"
  default     = "technology-system"
}

variable "tfenv" {
  description = "Environment"
}

variable "cluster_version" {
  description = "Kubernetes Cluster Version"
  default     = "1.18"
}

variable "instance_type" {
  # Standard Types (M | L | XL | XXL): m5.large | c5.xlarge | t3a.2xlarge | m5a.2xlarge
  description = "AWS Instance Type for provisioning"
  default     = "c5a.xlarge"
}

variable "instance_desired_size" {
  description = "Count of instances to be spun up within the context of a kubernetes cluster. Minimum: 2"
  default     = 8
}

variable "instance_min_size" {
  description = "Count of instances to be spun up within the context of a kubernetes cluster. Minimum: 2"
  default     = 2
}

variable "instance_max_size" {
  description = "Count of instances to be spun up within the context of a kubernetes cluster. Minimum: 2"
  default     = 12
}

variable "billingcustomer" {
  description = "Which BILLINGCUSTOMER is setup in AWS"
  default     = "ticketflap"
}

variable "key_name" {
  description = "TF Key"
  default     = "INFRA-env-singapore-key"
}

variable "root_vol_size" {
  description = "Root Volume Size"
  default     = "50"
}

variable "helm_installations" {
  type = object({
    vault_consul = bool
    ingress      = bool
  })
  default = {
    vault_consul = true
    ingress      = true
  }
}
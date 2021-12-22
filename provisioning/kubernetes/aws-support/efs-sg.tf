resource "aws_security_group" "efs_security_group" {
  name        = "${var.app_name}-${var.app_namespace}-${var.tfenv}-efs"
  description = "${var.app_name}-${var.app_namespace}-${var.tfenv}-efs"
  vpc_id      = module.eks-vpc.vpc_id
  ingress {
    description      = "NFS from VPC"
    from_port        = 2049
    to_port          = 2049
    protocol         = "tcp"
    cidr_blocks      = [module.subnet_addrs.base_cidr_block]
  }

  tags = {
        "Environment"                  = var.tfenv
        "Terraform"                    = "true"
        "Namespace"                    = var.app_namespace
        "Billingcustomer"              = var.billingcustomer
        "Product"                      = var.app_name
        "infrastructure-eks-terraform" = local.module_version
        "Name"                         = "${var.app_name}-${var.app_namespace}-${var.tfenv}-efs"
  }
}
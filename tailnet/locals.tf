locals {
  operators = yamldecode(file("${path.module}/operators.yaml"))
}

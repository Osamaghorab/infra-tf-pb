#!/bin/bash
echo 'Creating backend configuration'

cat <<EOF > backend.tf
terraform {
  backend "s3" {
    bucket         = "micsvc-terraform-state-bucket"
    key            = "micsvc/eks/terraform.tfstate"
    region         = "eu-north-1"
    encrypt        = true
  }
}
EOF

echo "Backend configured successfully"
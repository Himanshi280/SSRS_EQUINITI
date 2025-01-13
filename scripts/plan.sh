cd ..

terraform validate

terraform plan -var-file="./tfvars/EQ_Digital/account.auto.tfvars" -var-file="./tfvars/EQ_Digital/dashboards/puppet_dashboard_EQ_Digital.tfvars"  


cd ..

terraform validate

terraform plan -var-file="./tfvars/EQ_Digital/account.auto.tfvars" -var-file="./tfvars/EQ_Digital/dashboards/SSRS_dashboard_EQ_Digital.tfvars"  -var-file="./tfvars/EQ_Digital/alerts/SSRS_alerts.tfvars"   


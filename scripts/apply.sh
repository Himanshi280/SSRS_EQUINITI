cd ..
 
terraform apply -auto-approve -var-file="./tfvars/EQ_Digital/account.auto.tfvars" -var-file="./tfvars/EQ_Digital/dashboards/SSRS_dashboard_EQ_Digital.tfvars"  

module "ssrs_dashboard_eq_digital" {
  source     = "./modules/dashboards"
  dashboards = var.ssrs_dashboard_eq_digital
  account_id = var.account_id_EQ_Digital
}

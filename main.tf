module "ssrs_dashboard_eq_digital" {
  source     = "./modules/dashboards"
  dashboards = var.ssrs_dashboard_eq_digital
  account_id = var.account_id_EQ_Digital
}

//-------------------------------------------

module "ssrs_alerts_eq_digital" {
  source                       = "./modules/alerts"
  account_id                   = var.account_id_EQ_Digital
  alert_policy                 = var.alert_policy_ssrs_eq_digital
  incident_preference          = var.incident_preference_ssrs_eq_digital
  nrql_alert_condition_details = var.nrql_alert_condition_details_ssrs_eq_digital
}
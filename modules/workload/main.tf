resource "newrelic_workload" "workload" {
  for_each   = var.workload
  name       = each.value.name
  account_id = var.account_id

  entity_search_query {
    query = each.value.query
  }
  scope_account_ids = each.value.scope_account_ids

}
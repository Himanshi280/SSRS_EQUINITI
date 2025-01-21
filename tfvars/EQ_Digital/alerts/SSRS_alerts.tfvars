alert_policy_ssrs_eq_digital = "SSRS_POLICY"

incident_preference_ssrs_eq_digital = "PER_CONDITION_AND_TARGET"

nrql_alert_condition_details_ssrs_eq_digital = {
  "0" = {
    type                            = "static"
    account_id                      = 2947933
    name                            = "Database Accessible (Status)"
    description                     = ""
    runbook_url                     = "https://www.example.com"
    enabled                         = false
    violation_time_limit_seconds    = 3600
    aggregation_window              = 300
    aggregation_method              = "event_flow"
    aggregation_delay               = 120
    baseline_direction              = "upper_only"
    query                           = "FROM MssqlCustomQuerySample SELECT uniqueCount(instance) WHERE DatabaseStatus= 'ONLINE' AND label.query='dbstate' AND DatabaseName='ReportServer' FACET DatabaseName,DatabaseStatus,instance"
    warning                         = false
    critical                        = true
    critical_operator               = "below"
    critical_threshold              = 1
    critical_threshold_duration     = 300
    crirtical_threshold_occurrences = "all"
    network_lost_signals           = true
    expiration_duration            = 1800
    open_violation_on_expiration   = true
    close_violations_on_expiration = true
  },
  "1" = {
    type                            = "static"
    account_id                      = 2947933
    name                            = "Temporary database accessible Status"
    description                     = ""
    runbook_url                     = "https://www.example.com"
    enabled                         = false
    violation_time_limit_seconds    = 3600
    aggregation_window              = 300
    aggregation_method              = "event_flow"
    aggregation_delay               = 120
    baseline_direction              = "upper_only"
    query                           = "SELECT uniqueCount(instance) FROM MssqlCustomQuerySample WHERE DatabaseStatus ='ONLINE' AND label.query='dbstate' AND DatabaseName='ReportServerTempDB 'FACET DatabaseStatus,DatabaseName,hostname"
    warning                         = false
    critical                        = true
    critical_operator               = "below"
    critical_threshold              = 1
    critical_threshold_duration     = 300
    crirtical_threshold_occurrences = "all"
    network_lost_signals           = true
    expiration_duration            = 1800
    open_violation_on_expiration   = true
    close_violations_on_expiration = true
  },
  "2" = {
    type                            = "static"
    account_id                      = 2947933
    name                            = "Failed report execution count"
    description                     = ""
    runbook_url                     = "https://www.example.com"
    enabled                         = false
    violation_time_limit_seconds    = 3600
    aggregation_window              = 300
    aggregation_method              = "event_flow"
    aggregation_delay               = 120
    baseline_direction              = "upper_only"
    query                           = "SELECT count(*)  FROM MssqlCustomQuerySample WHERE FailedExecutions >100 AND  label.query='reportexec' FACET FailedExecutions,instance,hostname,entityGuid"
    warning                         = false
    critical                        = true
    critical_operator               = "above_or_equals"
    critical_threshold              = 1
    critical_threshold_duration     = 300
    crirtical_threshold_occurrences = "all"
    network_lost_signals           = false
  },
  "3" = {
    type                            = "static"
    account_id                      = 2947933
    name                            = "Web service accessibility status"
    description                     = ""
    runbook_url                     = "https://www.example.com"
    enabled                         = false
    violation_time_limit_seconds    = 3600
    aggregation_window              = 300
    aggregation_method              = "event_flow"
    aggregation_delay               = 120
    baseline_direction              = "upper_only"
    query                           = "FROM ReportServerWebServiceEvent SELECT count(*) WHERE Accessible='false' FACET URL,Accessible,hostname,entityGuid"
    warning                         = false
    critical                        = true
    critical_operator               = "above_or_equals"
    critical_threshold              = 1
    critical_threshold_duration     = 300
    crirtical_threshold_occurrences = "all"
    network_lost_signals           = false
  },
  "4" = {
    type                            = "static"
    account_id                      = 2947933
    name                            = "Report manager accessibility status"
    description                     = ""
    runbook_url                     = "https://www.example.com"
    enabled                         = false
    violation_time_limit_seconds    = 3600
    aggregation_window              = 300
    aggregation_method              = "event_flow"
    aggregation_delay               = 120
    baseline_direction              = "upper_only"
    query                           = "FROM ReportServerWebAppEvent SELECT count(*) WHERE Accessible='false' FACET Accessible,URL,hostname,entityGuid"
    warning                         = false
    critical                        = true
    critical_operator               = "above_or_equals"
    critical_threshold              = 1
    critical_threshold_duration     = 300
    crirtical_threshold_occurrences = "all"
    network_lost_signals           = false
  },
}  
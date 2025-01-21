resource "newrelic_one_dashboard" "ssrs" {
  name = "SSRS Dashboard"

  variable {
    default_values     = ["prd"]
    is_multi_selection = true
    name               = "Environment"
    nrql_query {
      account_ids = [var.newrelic_accountid]
      query       = "SELECT uniques(environment) FROM MssqlCustomQuerySample LIMIT MAX WHERE environment IS NOT NULL"
    }

    replacement_strategy = "string"
    title                = "Environment"
    type                 = "nrql"
  }

  variable {
    default_values     = ["*"]
    is_multi_selection = true
    name               = "Instance"
    nrql_query {
      account_ids = [var.newrelic_accountid]
      query       = "SELECT uniques(instance) FROM MssqlCustomQuerySample LIMIT MAX WHERE instance IS NOT NULL"
    }

    replacement_strategy = "string"
    title                = "Instance"
    type                 = "nrql"
  }

  page {
    name = "Monitors"

    widget_table {
            title  = "Database accessible :- summary"
            row    = 4
            column = 1
            width  = 12
            height = 3
            nrql_query {
            query  = "FROM MssqlCustomQuerySample SELECT  DatabaseCreateDate,DatabaseName,IsAutoCloseEnabled,is_in_standby,IsMasterKeyEncrypted,is_read_only,IsTrustworthyOn,RecoveryModel WHERE label.query='dbstate' AND DatabaseName='ReportServer'"
            }
        }
    widget_table {
            title  = "Temp. Data Accessible Summary"
            row    = 3
            column = 1
            width  = 12
            height = 3
            nrql_query {
            query  = "FROM MssqlCustomQuerySample SELECT  DatabaseCreateDate,DatabaseName,DatabaseStatus,IsAutoCloseEnabled,IsMasterKeyEncrypted,IsTrustworthyOn,RecoveryModel WHERE DatabaseStatus= 'ONLINE' AND label.query='dbstate' AND DatabaseName='ReportServerTempDB'"
            }
        }
    widget_table {
            title  = "Web services accessible"
            row    = 2
            column = 1
            width  = 6
            height = 3
            nrql_query {
                query  = "FROM ReportServerWebServiceEvent SELECT URL,Accessible"
            }
    }
    widget_table {
            title  = "Report manager accessible"
            row    = 2
            column = 7
            width  = 6
            height = 3
            nrql_query {
            query  = "FROM ReportServerWebAppEvent SELECT URL ,Accessible"
            }
    }

    widget_billboard {
            title  = "Database status"
            row    = 1
            column = 1
            width  = 3
            height = 3
            nrql_query {
            query  = "FROM MssqlCustomQuerySample SELECT latest(DatabaseStatus) WHERE label.query='dbstate' AND DatabaseName='ReportServer' FACET DatabaseName, instance"
          }
    }

    widget_billboard {
            title  = "Temp. Data Accessible Status"
            row    = 1
            column = 7
            width  = 3
            height = 3
            nrql_query {
            query  = "FROM MssqlCustomQuerySample SELECT latest(DatabaseStatus) WHERE DatabaseStatus= 'ONLINE' AND label.query='dbstate' AND DatabaseName='ReportServerTempDB' FACET instance"
          }
    }

    widget_pie {
            title  = "Count of Failed Execution"
            row    = 1
            column = 4
            width  = 3
            height = 3
            nrql_query {
            query  = "FROM MssqlCustomQuerySample select count(FailedExecutions) FACET instance where label.query='reportexec'"
          }
    }
    
    widget_table {
            title  = "Average Execution Minutes by Instance"
            row    = 1
            column = 10
            width  = 3
            height = 3
            nrql_query {
            query  = "FROM MssqlCustomQuerySample select average(ExecutionMinute)  FACET instance where label.query='reportexec' TIMESERIES"
          }
    }
    

        
    
  }

}

ssrs_dashboard_eq_digital = [
  {
    dashboard_name = "SSRS Dashboard"
    permissions    = "public_read_write"

    variable_details = {
      "0" = {
        default_values     = ["prd"]
        is_multi_selection = false
        variable_name      = "Environment"

        variable_status = true
        variable_query_details = {
          "0" = {
            variable_query = "SELECT uniques(environment) FROM MssqlCustomQuerySample LIMIT MAX WHERE environment IS NOT NULL"
          }
        }

        replacement_strategy = "string"
        variable_title       = "Environment"
        variable_type        = "nrql"
      }
      "1" = {
        default_values     = ["*"]
        is_multi_selection = false
        variable_name      = "Instance"

        variable_status = true
        variable_query_details = {
          "0" = {
            variable_query = "SELECT uniques(instance) FROM MssqlCustomQuerySample LIMIT MAX WHERE instance IS NOT NULL"
          }
        }

        replacement_strategy = "string"
        variable_title       = "Instance"
        variable_type        = "nrql"
      }
    }

    

    pages = {

      "0" = {
        page_name = "Monitors"

        widget_area_status        = false
        widget_bar_status         = false
        widget_billboard_status   = true
        widget_bullet_status      = false
        widget_funnel_status      = false
        widget_json_status        = false
        widget_heatmap_status     = false
        widget_histogram_status   = false
        widget_line_status        = false
        widget_markdown_status    = false
        widget_stacked_bar_status = true
        widget_pie_status         = true
        widget_log_table_status   = false
        widget_table_status       = true

        table = {
          "0" = {
            table_title  = "Database accessible :- summary"
            table_row    = 4
            table_column = 1
            table_width  = 12
            table_height = 3
            table_query  = "FROM MssqlCustomQuerySample SELECT  DatabaseCreateDate,DatabaseName,IsAutoCloseEnabled,is_in_standby,IsMasterKeyEncrypted,is_read_only,IsTrustworthyOn,RecoveryModel WHERE label.query='dbstate' AND DatabaseName='ReportServer'"
          },
         "1" = {
            table_title  = "Temp. Data Accessible Summary"
            table_row    = 3
            table_column = 1
            table_width  = 12
            table_height = 3
            table_query  = "FROM MssqlCustomQuerySample SELECT  DatabaseCreateDate,DatabaseName,DatabaseStatus,IsAutoCloseEnabled,IsMasterKeyEncrypted,IsTrustworthyOn,RecoveryModel WHERE DatabaseStatus= 'ONLINE' AND label.query='dbstate' AND DatabaseName='ReportServerTempDB'"
          },
          "2" = {
            table_title  = "Web services accessible"
            table_row    = 2
            table_column = 1
            table_width  = 6
            table_height = 3
            table_query  = "FROM ReportServerWebServiceEvent SELECT URL,Accessible"
          },
          "3" = {
            table_title  = "Report manager accessible"
            table_row    = 2
            table_column = 7
            table_width  = 6
            table_height = 3
            table_query  = "FROM ReportServerWebAppEvent SELECT URL ,Accessible"
          },
        },



        billboard = {
          "0" = {
            billboard_title  = "Database status"
            billboard_row    = 1
            billboard_column = 1
            billboard_width  = 3
            billboard_height = 3
            billboard_query  = "FROM MssqlCustomQuerySample SELECT latest(DatabaseStatus) WHERE label.query='dbstate' AND DatabaseName='ReportServer' FACET DatabaseName, instance"
          },
          "1" = {
            billboard_title  = "Temp. Data Accessible Status"
            billboard_row    = 1
            billboard_column = 7
            billboard_width  = 3
            billboard_height = 3
            billboard_query  = "FROM MssqlCustomQuerySample SELECT latest(DatabaseStatus) WHERE DatabaseStatus= 'ONLINE' AND label.query='dbstate' AND DatabaseName='ReportServerTempDB' FACET instance"
          },
        },

        pie = {
          "0" = {
            pie_title  = "Count of Failed Execution"
            pie_row    = 1
            pie_column = 4
            pie_width  = 3
            pie_height = 3
            pie_query  = "FROM MssqlCustomQuerySample select count(FailedExecutions) FACET instance where label.query='reportexec'"
          },
          
        },

        stacked_bar = {
          "0" = {
            stacked_bar_title  = "Average Execution Minutes by Instance"
            stacked_bar_row    = 1
            stacked_bar_column = 10
            stacked_bar_width  = 3
            stacked_bar_height = 3
            stacked_bar_query  = "FROM MssqlCustomQuerySample select average(ExecutionMinute)  FACET instance where label.query='reportexec' TIMESERIES"
          },
        }

      },

      
    }

  }
]

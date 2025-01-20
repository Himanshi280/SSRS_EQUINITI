ssrs_dashboard_eq_digital = [
  {
    dashboard_name = "SSRS Dashboard "
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
        widget_bar_status         = true
        widget_billboard_status   = true
        widget_bullet_status      = false
        widget_funnel_status      = false
        widget_json_status        = false
        widget_heatmap_status     = false
        widget_histogram_status   = false
        widget_line_status        = true
        widget_markdown_status    = false
        widget_stacked_bar_status = false
        widget_pie_status         = false
        widget_log_table_status   = false
        widget_table_status       = true

        table = {
          "0" = {
            table_title  = "Database accessible :- summary "
            table_row    = 1
            table_column = 1
            table_width  = 12
            table_height = 3
            table_query  = "FROM MssqlCustomQuerySample SELECT  DatabaseCreateDate,DatabaseName,IsAutoCloseEnabled,is_in_standby,IsMasterKeyEncrypted,is_read_only,IsTrustworthyOn,RecoveryModel WHERE label.query='dbstate' AND DatabaseName='ReportServer'"
          },
         
        },



        billboard = {
          "0" = {
            billboard_title  = "Database status"
            billboard_row    = 2
            billboard_column = 1
            billboard_width  = 4
            billboard_height = 3
            billboard_query  = "FROM MssqlCustomQuerySample SELECT latest(DatabaseStatus) WHERE label.query='dbstate' AND DatabaseName='ReportServer' FACET DatabaseName, instance"
          },
          
        },

        bar = {
          "0" = {
            bar_title  = "Count of Failed Execution"
            bar_row    = 2
            bar_column = 5
            bar_width  = 4
            bar_height = 3
            bar_query  = "FROM MssqlCustomQuerySample select count(FailedExecutions) FACET instance where label.query='reportexec'"
          },
          
        },

        line = {
          "0" = {
            line_title  = "Average Execution Minutes  by Instance"
            line_row    = 2
            line_column = 9
            line_width  = 4
            line_height = 3
            line_query  = "FROM MssqlCustomQuerySample select average(ExecutionMinute)  FACET instance where label.query='reportexec' TIMESERIES"
          },
        }

      },

      
    }

  }
]

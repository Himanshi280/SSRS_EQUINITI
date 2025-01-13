ssrs_dashboard_eq_digital = [
  {
    dashboard_name = "SSRS Dashboard "
    permissions    = "public_read_write"

    variable_details = {}

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
            billboard_width  = 6
            billboard_height = 3
            billboard_query  = "FROM MssqlCustomQuerySample SELECT latest(DatabaseStatus) WHERE label.query='dbstate' AND DatabaseName='ReportServer' FACET DatabaseName, instance"
          },
          
        },

        

      },

      
    }

  }
]

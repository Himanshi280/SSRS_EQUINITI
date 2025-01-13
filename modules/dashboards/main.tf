resource "newrelic_one_dashboard" "nr_dashboards" {
  for_each = { for idx, dashboard in var.dashboards : idx => dashboard }

  name        = each.value.dashboard_name
  permissions = each.value.permissions

  dynamic "page" {

    for_each = each.value.pages
    content {
      name = page.value.page_name

      dynamic "widget_area" {
        for_each = page.value.widget_area_status ? page.value.area : {}

        content {

          title  = widget_area.value.area_title
          row    = widget_area.value.area_row
          column = widget_area.value.area_column
          width  = widget_area.value.area_width
          height = widget_area.value.area_height

          nrql_query {
            query = widget_area.value.area_query
          }
        }
      }

      # ----------------------------------------- 


      dynamic "widget_bar" {
        for_each = page.value.widget_bar_status ? page.value.bar : {}

        content {

          title             = widget_bar.value.bar_title
          row               = widget_bar.value.bar_row
          column            = widget_bar.value.bar_column
          width             = widget_bar.value.bar_width
          height            = widget_bar.value.bar_height
          # ignore_time_range = widget_bar.value.bar_ignore_time_range != null ? widget_bar.value.bar_ignore_time_range : false
          nrql_query {
            query = widget_bar.value.bar_query
          }
        }
      }

      # -----------------------------------------

      dynamic "widget_billboard" {
        # for_each = lookup(page.value, "widget_billboard_status", false) ? lookup(page.value, "billboard", {}) : {}

        for_each = page.value.widget_billboard_status ? page.value.billboard : {}
        content {

          title  = widget_billboard.value.billboard_title
          row    = widget_billboard.value.billboard_row
          column = widget_billboard.value.billboard_column
          width  = widget_billboard.value.billboard_width
          height = widget_billboard.value.billboard_height
          # ignore_time_range = widget_billboard.value.billboard_ignore_time_range != null ? widget_billboard.value.billboard_ignore_time_range : false

          nrql_query {
            query = widget_billboard.value.billboard_query
          }
        }
      }

      #---------------------------------------------


      dynamic "widget_bullet" {
        for_each = page.value.widget_bullet_status ? page.value.bullet : {}

        content {

          title  = widget_bullet.value.bullet_title
          row    = widget_bullet.value.bullet_row
          column = widget_bullet.value.bullet_column
          width  = widget_bullet.value.bullet_width
          height = widget_bullet.value.bullet_height
          limit  = widget_bullet.value.bullet_limit

          nrql_query {
            query = widget_bullet.value.bullet_query
          }
        }
      }

      # -----------------------------------------

      dynamic "widget_funnel" {
        for_each = page.value.widget_funnel_status ? page.value.funnel : {}

        content {

          title  = widget_funnel.value.funnel_title
          row    = widget_funnel.value.funnel_row
          column = widget_funnel.value.funnel_column
          width  = widget_funnel.value.funnel_width
          height = widget_funnel.value.funnel_height

          nrql_query {
            query = widget_funnel.value.funnel_query
          }
        }
      }

      # -----------------------------------------


      dynamic "widget_json" {
        for_each = page.value.widget_json_status ? page.value.json : {}

        content {

          title  = widget_json.value.json_title
          row    = widget_json.value.json_row
          column = widget_json.value.json_column
          width  = widget_json.value.json_width
          height = widget_json.value.json_height

          nrql_query {
            query = widget_json.value.json_query
          }
        }
      }

      # -----------------------------------------

      dynamic "widget_heatmap" {
        for_each = page.value.widget_heatmap_status ? page.value.heatmap : {}

        content {

          title  = widget_heatmap.value.heatmap_title
          row    = widget_heatmap.value.heatmap_row
          column = widget_heatmap.value.heatmap_column
          width  = widget_heatmap.value.heatmap_width
          height = widget_heatmap.value.heatmap_height

          nrql_query {
            query = widget_heatmap.value.heatmap_query
          }
        }
      }

      # -----------------------------------------


      dynamic "widget_histogram" {
        for_each = page.value.widget_histogram_status ? page.value.histogram : {}

        content {

          title  = widget_histogram.value.histogram_title
          row    = widget_histogram.value.histogram_row
          column = widget_histogram.value.histogram_column
          width  = widget_histogram.value.histogram_width
          height = widget_histogram.value.histogram_height

          nrql_query {
            query = widget_histogram.value.histogram_query
          }
        }
      }

      # -----------------------------------------

      dynamic "widget_line" {
        for_each = page.value.widget_line_status ? page.value.line : {}

        content {

          title             = widget_line.value.line_title
          row               = widget_line.value.line_row
          column            = widget_line.value.line_column
          width             = widget_line.value.line_width
          height            = widget_line.value.line_height
          # ignore_time_range = widget_line.value.line_ignore_time_range != null ? widget_line.value.line_ignore_time_range : false

          nrql_query {
            query = widget_line.value.line_query
          }
        }
      }

      #-------------------------------

      dynamic "widget_markdown" {
        for_each = page.value.widget_markdown_status ? page.value.markdown : {}
        # for_each = lookup(page.value, "widget_markdown_status", false) ? lookup(page.value, "markdown", {}) : {}

        content {

          title  = widget_markdown.value.markdown_title
          row    = widget_markdown.value.markdown_row
          column = widget_markdown.value.markdown_column
          width  = widget_markdown.value.markdown_width
          height = widget_markdown.value.markdown_height
          text   = widget_markdown.value.markdown_text
        }
      }

      # -----------------------------------------

      dynamic "widget_stacked_bar" {
        for_each = page.value.widget_stacked_bar_status ? page.value.stacked_bar : {}

        content {

          title             = widget_stacked_bar.value.stacked_bar_title
          row               = widget_stacked_bar.value.stacked_bar_row
          column            = widget_stacked_bar.value.stacked_bar_column
          width             = widget_stacked_bar.value.stacked_bar_width
          height            = widget_stacked_bar.value.stacked_bar_height
          # ignore_time_range = widget_stacked_bar.value.stacked_bar_ignore_time_range != null ? widget_stacked_bar.value.stacked_bar_ignore_time_range : false

          nrql_query {
            query = widget_stacked_bar.value.stacked_bar_query
          }
        }
      }

      #-------------------------------------------

      dynamic "widget_pie" {
        for_each = page.value.widget_pie_status ? page.value.pie : {}

        content {

          title             = widget_pie.value.pie_title
          row               = widget_pie.value.pie_row
          column            = widget_pie.value.pie_column
          width             = widget_pie.value.pie_width
          height            = widget_pie.value.pie_height
          # ignore_time_range = widget_pie.value.pie_ignore_time_range != null ? widget_pie.value.pie_ignore_time_range : false

          nrql_query {
            query = widget_pie.value.pie_query
          }
        }
      }

      #----------------------------------------------

      dynamic "widget_log_table" {
        for_each = page.value.widget_log_table_status ? page.value.log_table : {}

        content {

          title  = widget_log_table.value.log_table_title
          row    = widget_log_table.value.log_table_row
          column = widget_log_table.value.log_table_column
          width  = widget_log_table.value.log_table_width
          height = widget_log_table.value.log_table_height

          nrql_query {
            query = widget_log_table.value.log_table_query
          }
        }
      }


      #-----------------------------------------------


      dynamic "widget_table" {
        for_each = page.value.widget_table_status == true ? page.value.table : {}

        content {

          title  = widget_table.value.table_title
          row    = widget_table.value.table_row
          column = widget_table.value.table_column
          width  = widget_table.value.table_width
          height = widget_table.value.table_height

          # filter_current_dashboard = widget_table.value.table_current_filter

          nrql_query {
            query = widget_table.value.table_query
          }

          # dynamic "threshold" {
          #   for_each = widget_table.value.threshold_status ? widget_table.value.threshold : {}

          #   content {
          #     column_name = threshold.value.name
          #     from        = threshold.value.from
          #     to          = threshold.value.to
          #     severity    = threshold.value.severity
          #   }
          # }

        }
      }
      #-----------------------------------------


    }

  }


  dynamic "variable" {
    for_each = each.value.variable_details
    content {
      default_values     = variable.value.default_values
      is_multi_selection = variable.value.is_multi_selection
      name               = variable.value.variable_name
      # nrql_query {
      #   account_ids = [var.account_id]
      #   query       = each.value.variable_query 
      # }

      dynamic "nrql_query" {
        for_each = variable.value.variable_status == true ? variable.value.variable_query_details : {}
        content {
          account_ids = [var.account_id]
          query       = nrql_query.value.variable_query
        }
      }
      replacement_strategy = variable.value.replacement_strategy
      title                = variable.value.variable_title
      type                 = variable.value.variable_type
    }

  }
}
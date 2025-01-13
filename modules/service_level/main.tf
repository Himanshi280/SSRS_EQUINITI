resource "newrelic_service_level" "service_level_values_with_bad_events" {
  for_each    = var.service_level_values_with_bad_events
  guid        = each.value.guid
  name        = each.value.name
  description = each.value.description

  events {
    account_id = each.value.account_id
    valid_events {
      from  = each.value.from_for_valid
      where = each.value.where_for_valid
    }
    bad_events {
      from  = each.value.from_for_bad
      where = each.value.where_for_bad

    }
  }

  objective {
    target = each.value.target
    time_window {
      rolling {
        count = each.value.count
        unit  = each.value.unit
      }
    }
  }
}

resource "newrelic_service_level" "service_level_values_with_good_events" {
  for_each    = var.service_level_values_with_good_events
  guid        = each.value.guid
  name        = each.value.name
  description = each.value.description

  events {
    account_id = each.value.account_id
    valid_events {
      from  = each.value.from_for_valid
      where = each.value.where_for_valid
    }
    good_events {
      from  = each.value.from_for_good
      where = each.value.where_for_good

    }
  }

  objective {
    target = each.value.target
    time_window {
      rolling {
        count = each.value.count
        unit  = each.value.unit
      }
    }
  }
}
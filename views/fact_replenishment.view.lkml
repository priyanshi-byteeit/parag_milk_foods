# The name of this view in Looker is "Fact Replenishment"
view: fact_replenishment {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `Parag_Milk_Foods.fact_replenishment` ;;
  drill_fields: [doc_no]

  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: doc_no {
    primary_key: yes
    type: number
    sql: ${TABLE}.doc_no ;;
  }
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Branch" in Explore.

  dimension: branch {
    type: string
    sql: ${TABLE}.branch ;;
  }

  dimension: closing_stock {
    type: number
    sql: ${TABLE}.closing_stock ;;
  }

  dimension: depot_manager {
    type: string
    sql: ${TABLE}.depot_manager ;;
  }

  dimension: dispatch_qty {
    type: number
    sql: ${TABLE}.dispatch_qty ;;
  }

  dimension: dispatched_from_plant {
    type: string
    sql: ${TABLE}.dispatched_from_plant ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: doc {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.doc_date ;;
  }

  dimension: fill_rate_pct {
    type: number
    sql: ${TABLE}.fill_rate_pct ;;
  }

  measure: average_fill_rate {
    type: average
    sql: ${fill_rate_pct} ;;
    value_format_name: percent_1
    label: "Avg Fill Rate %"
  }

  dimension: max_threshold {
    type: number
    sql: ${TABLE}.max_threshold ;;
  }

  dimension: min_threshold {
    type: number
    sql: ${TABLE}.min_threshold ;;
  }

  dimension: movement_type {
    type: string
    sql: ${TABLE}.movement_type ;;
  }

  dimension: opening_stock {
    type: number
    sql: ${TABLE}.opening_stock ;;
  }

  dimension: pack_category_id {
    type: number
    sql: ${TABLE}.pack_category_id ;;
  }

  dimension: product_id {
    type: number
    sql: ${TABLE}.product_id ;;
  }

  dimension: revenue_stream {
    type: string
    sql: ${TABLE}.revenue_stream ;;
  }
  measure: count {
    type: count
    drill_fields: [doc_no]
  }
}

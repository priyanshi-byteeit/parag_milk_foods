# The name of this view in Looker is "Fact Quality Inspection"
view: fact_quality_inspection {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `Parag_Milk_Foods.fact_quality_inspection` ;;
  drill_fields: [inspection_id]

  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: inspection_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.inspection_id ;;
  }
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Batch No" in Explore.

  dimension: batch_no {
    type: string
    sql: ${TABLE}.batch_no ;;
  }

  dimension: branch {
    type: string
    sql: ${TABLE}.branch ;;
  }

  dimension: call_type {
    type: string
    sql: ${TABLE}.call_type ;;
  }

  dimension: cold_chain_temp_c {
    type: number
    sql: ${TABLE}.cold_chain_temp_c ;;
  }

  dimension: days_to_expiry {
    type: number
    sql: ${TABLE}.days_to_expiry ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: expiry {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.expiry_date ;;
  }

  dimension_group: inspection {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.inspection_date ;;
  }

  dimension_group: manufacture {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.manufacture_date ;;
  }

  dimension: product_id {
    type: number
    sql: ${TABLE}.product_id ;;
  }

  dimension: qa_inspector {
    type: string
    sql: ${TABLE}.qa_inspector ;;
  }

  dimension: qty_at_risk {
    type: number
    sql: ${TABLE}.qty_at_risk ;;
  }

  dimension: revenue_stream {
    type: string
    sql: ${TABLE}.revenue_stream ;;
  }

  dimension: sub_type {
    type: string
    sql: ${TABLE}.sub_type ;;
  }

  dimension: value_at_risk_inr {
    type: number
    sql: ${TABLE}.value_at_risk_inr ;;
  }

  measure: total_value_at_risk {
    type: sum
    sql: ${value_at_risk_inr} ;;
    value_format: "\"₹\"#,##0"
    label: "Total Quality Risk Value (INR)"
  }

  measure: total_value_at_risk_lakh {
    type: number
    sql: ${total_value_at_risk} / 100000.0 ;;
    value_format: "\"₹\"#,##0.00\" L\""
    label: "Quality Risk Value (Lakh)"
  }
  measure: count {
    type: count
    drill_fields: [inspection_id]
  }

}

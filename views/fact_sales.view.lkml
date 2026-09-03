# The name of this view in Looker is "Fact Sales"
view: fact_sales {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `Parag_Milk_Foods.fact_sales` ;;
  drill_fields: [invoice_no]

  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: invoice_no {
    primary_key: yes
    type: number
    sql: ${TABLE}.invoice_no ;;
  }
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Basic Price" in Explore.

  dimension: basic_price {
    type: number
    sql: ${TABLE}.basic_price ;;
  }

  dimension: branch {
    type: string
    sql: ${TABLE}.branch ;;
  }

  dimension: brand_id {
    type: number
    sql: ${TABLE}.brand_id ;;
  }

  dimension: channel {
    type: string
    sql: ${TABLE}.channel ;;
  }

  dimension: customer {
    type: string
    sql: ${TABLE}.customer ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: invoice {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.invoice_date ;;
  }

  dimension: invoice_total {
    type: number
    sql: ${TABLE}.invoice_total ;;
  }
  measure: total_invoice_total {
    type: sum
    sql: ${invoice_total} ;;
    value_format_name: decimal_2
    label: "Total Revenue (INR)"
  }

  measure: average_invoice_total {
    type: average
    sql: ${invoice_total} ;;
    value_format_name: decimal_2
    label: "Average Order Value (INR)"
  }
  dimension: pack_category_id {
    type: number
    sql: ${TABLE}.pack_category_id ;;
  }

  dimension: payment_terms {
    type: string
    sql: ${TABLE}.payment_terms ;;
  }

  dimension: product_id {
    type: number
    sql: ${TABLE}.product_id ;;
  }

  dimension: qty {
    type: number
    sql: ${TABLE}.qty ;;
  }
  measure: total_qty {
    type: sum
    sql: ${qty} ;;
    label: "Total Units Sold"
  }

  dimension: revenue_stream {
    type: string
    sql: ${TABLE}.revenue_stream ;;
  }

  dimension: sales_employee {
    type: string
    sql: ${TABLE}.sales_employee ;;
  }

  dimension: tax_amt {
    type: number
    sql: ${TABLE}.tax_amt ;;
  }
  measure: count {
    type: count
    drill_fields: [invoice_no]
  }
}

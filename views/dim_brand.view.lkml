# The name of this view in Looker is "Dim Brand"
view: dim_brand {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `Parag_Milk_Foods.dim_brand` ;;
  drill_fields: [brand_id]

  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: brand_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.brand_id ;;
  }
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Brand Launched Year" in Explore.

  dimension: brand_launched_year {
    type: number
    sql: ${TABLE}.brand_launched_year ;;
  }

  dimension: brand_name {
    type: string
    sql: ${TABLE}.brand_name ;;
  }

  dimension: brand_segment {
    type: string
    sql: ${TABLE}.brand_segment ;;
  }
  measure: count {
    type: count
    drill_fields: [brand_id, brand_name]
  }
}

# The name of this view in Looker is "Dim Pack Category"
view: dim_pack_category {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `Parag_Milk_Foods.dim_pack_category` ;;
  drill_fields: [pack_category_id]

  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: pack_category_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.pack_category_id ;;
  }
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Category Name" in Explore.

  dimension: category_name {
    type: string
    sql: ${TABLE}.category_name ;;
  }
  measure: count {
    type: count
    drill_fields: [pack_category_id, category_name]
  }
}

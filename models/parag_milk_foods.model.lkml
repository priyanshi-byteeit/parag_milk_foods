# Define the database connection to be used for this model.
connection: "parag_milk_foods"

# include all the views
include: "/views/**/*.view.lkml"

# Datagroups define a caching policy for an Explore. To learn more,
# use the Quick Help panel on the right to see documentation.

datagroup: parag_milk_foods_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: parag_milk_foods_default_datagroup

# Explores allow you to join together different views (database tables) based on the
# relationships between fields. By joining a view into an Explore, you make those
# fields available to users for data analysis.
# Explores should be purpose-built for specific use cases.

# To see the Explore you’re building, navigate to the Explore menu and select an Explore under "Parag Milk Foods"

# To create more sophisticated Explores that involve multiple views, you can use the join parameter.
# Typically, join parameters require that you define the join type, join relationship, and a sql_on clause.
# Each joined view also needs to define a primary key.

explore: fact_sales {
  join: dim_product {
    type: left_outer
    sql_on: ${fact_sales.product_id} = ${dim_product.product_id} ;;
    relationship: many_to_one
  }
  join: dim_brand {
    type: left_outer
    sql_on: ${fact_sales.brand_id} = ${dim_brand.brand_id} ;;
    relationship: many_to_one
  }
  join: dim_pack_category {
    type: left_outer
    sql_on: ${fact_sales.pack_category_id} = ${dim_pack_category.pack_category_id} ;;
    relationship: many_to_one
  }
  join: dim_location {
    type: left_outer
    sql_on: ${fact_sales.branch} = ${dim_location.location_name} ;;
    relationship: many_to_one
  }
}

explore: fact_replenishment {
  join: dim_product {
    type: left_outer
    sql_on: ${fact_replenishment.product_id} = ${dim_product.product_id} ;;
    relationship: many_to_one
  }
  join: dim_brand {
    type: left_outer
    sql_on: ${dim_product.brand_id} = ${dim_brand.brand_id} ;;
    relationship: many_to_one
  }
  join: dim_pack_category {
    type: left_outer
    sql_on: ${fact_replenishment.pack_category_id} = ${dim_pack_category.pack_category_id} ;;
    relationship: many_to_one
  }
  join: dim_location {
    type: left_outer
    sql_on: ${fact_replenishment.branch} = ${dim_location.location_name} ;;
    relationship: many_to_one
  }
}

explore: fact_quality_inspection {
  join: dim_product {
    type: left_outer
    sql_on: ${fact_quality_inspection.product_id} = ${dim_product.product_id} ;;
    relationship: many_to_one
  }
  join: dim_brand {
    type: left_outer
    sql_on: ${dim_product.brand_id} = ${dim_brand.brand_id} ;;
    relationship: many_to_one
  }
  join: dim_location {
    type: left_outer
    sql_on: ${fact_quality_inspection.branch} = ${dim_location.location_name} ;;
    relationship: many_to_one
  }
}

explore: unified_metrics {
  join: dim_product {
    type: left_outer
    sql_on: ${unified_metrics.product_id} = ${dim_product.product_id} ;;
    relationship: many_to_one
  }
  join: dim_brand {
    type: left_outer
    sql_on: ${unified_metrics.brand_id} = ${dim_brand.brand_id} ;;
    relationship: many_to_one
  }
  join: dim_pack_category {
    type: left_outer
    sql_on: ${unified_metrics.pack_category_id} = ${dim_pack_category.pack_category_id} ;;
    relationship: many_to_one
  }
  join: dim_location {
    type: left_outer
    sql_on: ${unified_metrics.branch} = ${dim_location.location_name} ;;
    relationship: many_to_one
  }
}

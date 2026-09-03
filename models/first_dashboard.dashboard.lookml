- dashboard: first_dashboard
  title: Parag Milk Foods – Executive Overview
  layout: newspaper
  preferred_viewer: dashboards-next
  load_configuration: wait
  filters:
    - name: Date Range
      title: Date Range
      type: field_filter
      default_value: 90 days
      allow_multiple_values: true
      required: false
      ui_config:
        type: relative_timeframes
        display: inline
      model: parag_milk_foods
      explore: fact_sales
      field: fact_sales.invoice_date_date
    - name: Brand
      title: Brand
      type: field_filter
      default_value: ""
      allow_multiple_values: true
      required: false
      ui_config:
        type: tag_list
        display: popover
      model: parag_milk_foods
      explore: fact_sales
      field: dim_brand.brand_name
    - name: Channel
      title: Channel
      type: field_filter
      default_value: ""
      allow_multiple_values: true
      required: false
      ui_config:
        type: tag_list
        display: popover
      model: parag_milk_foods
      explore: fact_sales
      field: fact_sales.channel
    - name: State
      title: State
      type: field_filter
      default_value: ""
      allow_multiple_values: true
      required: false
      ui_config:
        type: tag_list
        display: popover
      model: parag_milk_foods
      explore: fact_sales
      field: dim_location.state

  elements:
    - name: total_revenue
      title: Total Revenue
      type: single_value
      model: parag_milk_foods
      explore: fact_sales
      fields: [fact_sales.total_invoice_total]
      listen:
        Date Range: fact_sales.invoice_date_date
        Brand: dim_brand.brand_name
        Channel: fact_sales.channel
        State: dim_location.state
      row: 0
      col: 0
      width: 6
      height: 4

    - name: total_units_sold
      title: Total Units Sold
      type: single_value
      model: parag_milk_foods
      explore: fact_sales
      fields: [fact_sales.total_qty]
      listen:
        Date Range: fact_sales.invoice_date_date
        Brand: dim_brand.brand_name
        Channel: fact_sales.channel
        State: dim_location.state
      row: 0
      col: 6
      width: 6
      height: 4

    - name: avg_fill_rate
      title: Avg Fill Rate %
      type: single_value
      model: parag_milk_foods
      explore: fact_replenishment
      fields: [fact_replenishment.average_fill_rate]
      listen:
        Date Range: fact_replenishment.doc_date_date
        Brand: dim_brand.brand_name
        State: dim_location.state
      row: 0
      col: 12
      width: 6
      height: 4

    - name: quality_risk_value
      title: Quality Risk Value (INR)
      type: single_value
      model: parag_milk_foods
      explore: fact_quality_inspection
      fields: [fact_quality_inspection.total_value_at_risk]
      listen:
        Date Range: fact_quality_inspection.inspection_date_date
        Brand: dim_brand.brand_name
        State: dim_location.state
      row: 0
      col: 18
      width: 6
      height: 4

    - name: revenue_trend
      title: Revenue Trend
      type: looker_line
      model: parag_milk_foods
      explore: fact_sales
      fields: [fact_sales.invoice_date_week, fact_sales.total_invoice_total]
      pivots: []
      listen:
        Date Range: fact_sales.invoice_date_date
        Brand: dim_brand.brand_name
        Channel: fact_sales.channel
        State: dim_location.state
      row: 4
      col: 0
      width: 12
      height: 8

    - name: revenue_by_state
      title: Revenue by State
      type: looker_bar
      model: parag_milk_foods
      explore: fact_sales
      fields: [dim_location.state, fact_sales.total_invoice_total]
      sorts: [fact_sales.total_invoice_total desc]
      limit: 10
      listen:
        Date Range: fact_sales.invoice_date_date
        Brand: dim_brand.brand_name
        Channel: fact_sales.channel
      row: 4
      col: 12
      width: 12
      height: 8

    - name: revenue_by_channel
      title: Revenue by Channel
      type: looker_pie
      model: parag_milk_foods
      explore: fact_sales
      fields: [fact_sales.channel, fact_sales.total_invoice_total]
      listen:
        Date Range: fact_sales.invoice_date_date
        Brand: dim_brand.brand_name
        State: dim_location.state
      row: 12
      col: 0
      width: 8
      height: 8

    - name: top_products_by_revenue
      title: Top Products by Revenue
      type: looker_grid
      model: parag_milk_foods
      explore: fact_sales
      fields: [dim_product.product_name, fact_sales.total_invoice_total, fact_sales.total_qty]
      sorts: [fact_sales.total_invoice_total desc]
      limit: 10
      listen:
        Date Range: fact_sales.invoice_date_date
        Brand: dim_brand.brand_name
        Channel: fact_sales.channel
        State: dim_location.state
      row: 12
      col: 8
      width: 16
      height: 8

    - name: revenue_heatmap_state_category
      title: "Revenue Heatmap (State x Category)"
      type: looker_grid
      model: parag_milk_foods
      explore: fact_sales
      fields: [dim_location.state, dim_product.category, fact_sales.total_invoice_total]
      pivots: [dim_product.category]
      listen:
        Date Range: fact_sales.invoice_date_date
        Brand: dim_brand.brand_name
        Channel: fact_sales.channel
      row: 20
      col: 0
      width: 24
      height: 10

- dashboard: third_dashboard
  title: Parag Milk Foods – Business Performance Dashboard
  layout: newspaper
  preferred_viewer: dashboards-next
  load_configuration: wait

  filters:
    - name: Date Range
      title: Date
      type: field_filter
      default_value: 90 days
      allow_multiple_values: true
      required: false
      ui_config:
        type: relative_timeframes
        display: inline
      model: parag_milk_foods
      explore: fact_sales
      field: fact_sales.invoice_date
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

  # ================= HEADER BRANDING =================
    - name: header_branding
      title: ""
      type: text
      body_text: |
        <div style="display:flex; align-items:center; height:100%; font-family: 'Google Sans', 'Product Sans', Roboto, Arial, sans-serif;">
          <img src="https://upload.wikimedia.org/wikipedia/en/d/d1/Parag_milk_foods_logo.png" style="height:64px; width:auto; margin-right:20px;" />
          <div style="border-left:2px solid #DDD; height:40px; margin-right:20px;"></div>
          <div style="font-size:18px; font-weight:600; color:#2E6DA4;">Business Performance Dashboard</div>
        </div>
      row: 0
      col: 0
      width: 24
      height: 2

  # ================= KPI ROW =================
    - name: total_revenue
      title: Total Revenue
      type: single_value
      model: parag_milk_foods
      explore: fact_sales
      fields: [fact_sales.total_invoice_total_cr]
      custom_color_enabled: true
      custom_color: "#2E6DA4"
      listen:
        Date Range: fact_sales.invoice_date
        Brand: dim_brand.brand_name
        Channel: fact_sales.channel
        State: dim_location.state
      row: 1
      col: 0
      width: 4
      height: 2

    - name: total_sales_units
      title: Total Sales (Units)
      type: single_value
      model: parag_milk_foods
      explore: fact_sales
      fields: [fact_sales.total_qty_lakh]
      custom_color_enabled: true
      custom_color: "#7CB342"
      listen:
        Date Range: fact_sales.invoice_date
        Brand: dim_brand.brand_name
        Channel: fact_sales.channel
        State: dim_location.state
      row: 1
      col: 4
      width: 4
      height: 2

    - name: avg_fill_rate
      title: Avg Fill Rate %
      type: single_value
      model: parag_milk_foods
      explore: fact_replenishment
      fields: [fact_replenishment.average_fill_rate]
      custom_color_enabled: true
      custom_color: "#F2A81D"
      listen:
        Date Range: fact_replenishment.doc_date
        Brand: dim_brand.brand_name
        State: dim_location.state
      row: 1
      col: 8
      width: 4
      height: 2

    - name: quality_risk_value
      title: Quality Risk Value
      type: single_value
      model: parag_milk_foods
      explore: fact_quality_inspection
      fields: [fact_quality_inspection.total_value_at_risk_lakh]
      custom_color_enabled: true
      custom_color: "#B0272D"
      listen:
        Date Range: fact_quality_inspection.inspection_date
        Brand: dim_brand.brand_name
        State: dim_location.state
      row: 1
      col: 12
      width: 4
      height: 2

    - name: active_depots
      title: Active Depots
      type: single_value
      model: parag_milk_foods
      explore: fact_sales
      fields: [fact_sales.branch_count]
      custom_color_enabled: true
      custom_color: "#2E6DA4"
      listen:
        Date Range: fact_sales.invoice_date
        Brand: dim_brand.brand_name
        Channel: fact_sales.channel
      row: 1
      col: 16
      width: 4
      height: 2

    - name: avg_order_value
      title: Average Order Value
      type: single_value
      model: parag_milk_foods
      explore: fact_sales
      fields: [fact_sales.average_invoice_total]
      custom_color_enabled: true
      custom_color: "#7CB342"
      listen:
        Date Range: fact_sales.invoice_date
        Brand: dim_brand.brand_name
        Channel: fact_sales.channel
        State: dim_location.state
      row: 1
      col: 20
      width: 4
      height: 2

  # ================= TRENDS =================
    - name: revenue_trend
      title: Revenue Trend
      type: looker_line
      model: parag_milk_foods
      explore: fact_sales
      fields: [fact_sales.invoice_date, fact_sales.total_invoice_total]
      colors: ["#2E6DA4"]
      listen:
        Date Range: fact_sales.invoice_date
        Brand: dim_brand.brand_name
        Channel: fact_sales.channel
        State: dim_location.state
      row: 3
      col: 0
      width: 8
      height: 5

    - name: sales_volume_trend
      title: "Sales Volume Trend (Units)"
      type: looker_line
      model: parag_milk_foods
      explore: fact_sales
      fields: [fact_sales.invoice_date, fact_sales.total_qty]
      colors: ["#7CB342"]
      listen:
        Date Range: fact_sales.invoice_date
        Brand: dim_brand.brand_name
        Channel: fact_sales.channel
        State: dim_location.state
      row: 3
      col: 8
      width: 8
      height: 5

    - name: revenue_by_state
      title: Revenue by State
      type: looker_bar
      model: parag_milk_foods
      explore: fact_sales
      fields: [dim_location.state, fact_sales.total_invoice_total]
      sorts: [fact_sales.total_invoice_total desc]
      limit: 10
      colors: ["#F2A81D"]
      listen:
        Date Range: fact_sales.invoice_date
        Brand: dim_brand.brand_name
        Channel: fact_sales.channel
      row: 3
      col: 16
      width: 8
      height: 5

  # ================= CHANNEL, PRODUCTS, CATEGORY =================
    - name: sales_by_channel
      title: Sales by Channel
      type: looker_pie
      model: parag_milk_foods
      explore: fact_sales
      fields: [fact_sales.channel, fact_sales.total_invoice_total]
      value_labels: legend
      label_type: labPer
      donut: true
      colors: ["#2E6DA4", "#B0272D", "#F2A81D", "#7CB342", "#5A9BD5", "#E8A87C"]
      listen:
        Date Range: fact_sales.invoice_date
        Brand: dim_brand.brand_name
        State: dim_location.state
      row: 8
      col: 0
      width: 8
      height: 5

    - name: top_products_by_revenue
      title: Top 5 Products by Revenue
      type: looker_grid
      model: parag_milk_foods
      explore: fact_sales
      fields: [dim_product.product_name, fact_sales.total_invoice_total, fact_sales.total_qty]
      sorts: [fact_sales.total_invoice_total desc]
      limit: 5
      listen:
        Date Range: fact_sales.invoice_date
        Brand: dim_brand.brand_name
        Channel: fact_sales.channel
        State: dim_location.state
      row: 8
      col: 8
      width: 8
      height: 5

    - name: revenue_by_category
      title: Revenue by Product Category
      type: looker_pie
      model: parag_milk_foods
      explore: fact_sales
      fields: [dim_product.category, fact_sales.total_invoice_total]
      value_labels: legend
      label_type: labPer
      donut: true
      colors: ["#B0272D", "#2E6DA4", "#F2A81D", "#7CB342", "#5A9BD5", "#E8A87C"]
      listen:
        Date Range: fact_sales.invoice_date
        Brand: dim_brand.brand_name
        Channel: fact_sales.channel
      row: 8
      col: 16
      width: 8
      height: 5

  # ================= MAP, DISTRIBUTORS (proxy), COMBO TREND =================
    - name: sales_by_state_map
      title: "Sales by State (Map)"
      type: looker_google_map
      model: parag_milk_foods
      explore: fact_sales
      fields: [dim_location.location, dim_location.state, fact_sales.total_qty]
      map_marker_type: circle
      map_marker_radius_mode: proportional_value
      map_marker_radius_min: 4
      map_marker_radius_max: 18
      map_marker_color_mode: value
      map_marker_color: "#2E6DA4"
      show_view_all: false
      listen:
        Date Range: fact_sales.invoice_date
        Brand: dim_brand.brand_name
        Channel: fact_sales.channel
      row: 13
      col: 0
      width: 8
      height: 5

    - name: top_distributors_by_sales
      title: "Top 5 Customers/Distributors by Sales (proxy)"
      type: looker_grid
      model: parag_milk_foods
      explore: fact_sales
      fields: [fact_sales.customer, fact_sales.total_qty, fact_sales.total_invoice_total]
      sorts: [fact_sales.total_invoice_total desc]
      limit: 5
      listen:
        Date Range: fact_sales.invoice_date
        Brand: dim_brand.brand_name
        Channel: fact_sales.channel
        State: dim_location.state
      row: 13
      col: 8
      width: 8
      height: 5

    - name: monthly_revenue_vs_sales_trend
      title: Monthly Revenue vs Sales Trend
      type: looker_column
      model: parag_milk_foods
      explore: fact_sales
      fields: [fact_sales.invoice_month, fact_sales.total_invoice_total_cr, fact_sales.total_qty]
      series_types:
        "Total Qty": line
      series_colors:
        "Total Invoice Total Cr": "#2E6DA4"
        "Total Qty": "#F2A81D"
      listen:
        Date Range: fact_sales.invoice_date
        Brand: dim_brand.brand_name
        Channel: fact_sales.channel
        State: dim_location.state
      row: 13
      col: 16
      width: 8
      height: 5

  # ================= FOOTER BANNER =================
    - name: banner_footer
      title: ""
      type: text
      body_text: |
        <div style="background: linear-gradient(90deg, #EAF2F8 0%, #FFF8E7 100%); border-radius: 10px; padding: 12px 20px; height: 100%; display:flex; align-items:center; justify-content:space-between;">
          <div>
            <div style="margin:0; color:#2E6DA4; font-size:16px; font-weight:700;">Goodness in every drop</div>
            <div style="color:#5A5A5A; font-size:11px;">Nourishing India with trusted dairy &amp; nutrition products</div>
          </div>
          <div style="display:flex; gap:24px; text-align:center; font-size:11px;">
            <div style="color:#2E6DA4;">🛡️<br/><b>Quality</b></div>
            <div style="color:#B0272D;">👥<br/><b>Community</b></div>
            <div style="color:#F2A81D;">❤️<br/><b>Health</b></div>
            <div style="color:#7CB342;">🌱<br/><b>Sustainability</b></div>
          </div>
        </div>
      row: 18
      col: 0
      width: 24
      height: 2

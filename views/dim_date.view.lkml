view: dim_date {
  sql_table_name: `byteeit-data-ai-test-01.Parag_Milk_Foods.dim_date` ;;

  dimension: pk {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${TABLE}.date ;;
  }

  dimension_group: date {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.date ;;
  }

  dimension: year {
    type: number
    sql: ${TABLE}.year ;;
  }

  dimension: month {
    type: number
    sql: ${TABLE}.month ;;
  }

  dimension: month_name {
    type: string
    sql: ${TABLE}.month_name ;;
  }

  dimension: week_of_year {
    type: number
    sql: ${TABLE}.week_of_year ;;
  }

  dimension: day_of_week {
    type: string
    sql: ${TABLE}.day_of_week ;;
  }

  dimension: is_weekend {
    type: yesno
    sql: ${TABLE}.is_weekend ;;
  }

  dimension: quarter {
    type: number
    sql: ${TABLE}.quarter ;;
  }

  measure: count {
    type: count
  }
}

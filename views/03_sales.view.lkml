view: sales {
  sql_table_name: `BI4ALL_Training_prd.prd_sales` ;;

  dimension: amount {
    type: number
    sql: ${TABLE}.Amount ;;
  }

  dimension: customer_id {
    type: number
    sql: ${TABLE}.CustomerID ;;
  }

  dimension_group: date {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.Date ;;
  }

  dimension: discount {
    type: number
    sql: ${TABLE}.Discount ;;
  }

  dimension: file_extract_timestamp {
    type: string
    sql: ${TABLE}.FileExtractTimestamp ;;
  }

  dimension: product_id {
    type: number
    sql: ${TABLE}.ProductID ;;
  }

  dimension: qty {
    type: number
    sql: ${TABLE}.Qty ;;
  }

  dimension: sale_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.SaleId ;;
  }

  dimension_group: ss_creation_date {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.ssCreationDateTime ;;
  }

  dimension_group: ss_last_update_date {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.ssLastUpdateDateTime ;;
  }

  dimension: store_id {
    type: number
    sql: ${TABLE}.StoreID ;;
  }

  dimension_group: uploaded {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    datatype: datetime
    sql: ${TABLE}.UploadedAt ;;
  }

  measure: count {
    type: count
  }

  measure: total_sales {
    type: sum
    sql:  ${amount} ;;
    value_format_name:  usd_0
  }

  measure: avg_sales {
    type: average
    sql:  ${amount} ;;
    value_format_name:  usd_0
  }


}

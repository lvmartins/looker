view: prd_product {
  sql_table_name: `BI4ALL_Training_prd.prd_product`
    ;;

  dimension: category {
    type: string
    sql: ${TABLE}.Category ;;
  }

  dimension_group: creation_date {
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
    sql: ${TABLE}.CreationDateTime ;;
  }

  dimension_group: dbt_updated {
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
    sql: ${TABLE}.dbt_updated_at ;;
  }

  dimension_group: dbt_valid_from {
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
    sql: ${TABLE}.dbt_valid_from ;;
  }

  dimension_group: dbt_valid_to {
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
    sql: ${TABLE}.dbt_valid_to ;;
  }

  dimension: department {
    type: string
    sql: ${TABLE}.Department ;;
  }

  dimension: file_extract_timestamp {
    type: string
    sql: ${TABLE}.FileExtractTimestamp ;;
  }

  dimension_group: last_update_date {
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
    sql: ${TABLE}.LastUpdateDateTime ;;
  }

  dimension: product_id {
    type: number
    sql: ${TABLE}.ProductID ;;
  }

  dimension: product_key {
    primary_key: yes
    type: string
    sql: ${TABLE}.Product_key ;;
  }

  dimension: product_name {
    type: string
    sql: ${TABLE}.ProductName ;;
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
    drill_fields: [product_name]
  }
}

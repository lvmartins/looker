view: stores {
  sql_table_name: `BI4ALL_Training_prd.prd_store`
    ;;

  dimension: address {
    type: string
    sql: ${TABLE}.Address ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.Country ;;
  }

  dimension_group: creation_datetime {
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
    sql: ${TABLE}.CreationDatetime ;;
  }

  dimension: file_extract_timestamp {
    type: string
    sql: ${TABLE}.file_extract_timestamp ;;
  }

  dimension_group: last_update_datetime {
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
    sql: ${TABLE}.LastUpdateDatetime ;;
  }

  dimension: store_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.StoreID ;;
  }

  dimension: store_key {
    type: string
    sql: ${TABLE}.StoreKey ;;
  }

  dimension: store_name {
    type: string
    sql: ${TABLE}.StoreName ;;
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
    sql: ${TABLE}.uploaded_at ;;
  }

  ############ MEASURES ##########
  measure: count {
    type: count
    drill_fields: [store_name]
  }

}

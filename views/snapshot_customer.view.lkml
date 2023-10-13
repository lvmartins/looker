view: snapshot_customer {
  sql_table_name: `bi4all-elt-framework-dev.BI4ALL_Training_stg.snapshot_customer` ;;

  dimension: address {
    type: string
    sql: ${TABLE}.Address ;;
  }
  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.Country ;;
  }
  dimension_group: creation_date {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.CreationDateTime ;;
  }
  dimension_group: customer_birthdate {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.CustomerBirthdate ;;
  }
  dimension: customer_id {
    type: number
    sql: ${TABLE}.CustomerID ;;
  }
  dimension: customer_key {
    type: string
    sql: ${TABLE}.CustomerKey ;;
  }
  dimension: customer_name {
    type: string
    sql: ${TABLE}.CustomerName ;;
  }
  dimension: dbt_scd_id {
    type: string
    sql: ${TABLE}.dbt_scd_id ;;
  }
  dimension_group: dbt_updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.dbt_updated_at ;;
  }
  dimension_group: dbt_valid_from {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.dbt_valid_from ;;
  }
  dimension_group: dbt_valid_to {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.dbt_valid_to ;;
  }
  dimension: file_extract_timestamp {
    type: string
    sql: ${TABLE}.FileExtractTimestamp ;;
  }
  dimension_group: last_update_date {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.LastUpdateDateTime ;;
  }
  dimension: mobile_phone {
    type: string
    sql: ${TABLE}.MobilePhone ;;
  }
  dimension: postal_code {
    type: string
    sql: ${TABLE}.PostalCode ;;
  }
  dimension_group: uploaded {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    datatype: datetime
    sql: ${TABLE}.UploadedAt ;;
  }
  measure: count {
    type: count
    drill_fields: [customer_name]
  }
}

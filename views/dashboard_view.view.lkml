view: dashboard_view {
  sql_table_name: `BI4ALL_Training_prd.dashboard_view`
    ;;

  dimension: amount_country {
    type: number
    sql: ${TABLE}.Amount_Country ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.Country ;;
  }

  dimension: stores {
    hidden: yes
    sql: ${TABLE}.Stores ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}

view: dashboard_view__stores {
  drill_fields: [store_id]

  dimension: store_id {
    primary_key: yes
    type: number
    sql: StoreID ;;
  }

  dimension: amount_store {
    type: number
    sql: Amount_Store ;;
  }

  dimension: dashboard_view__stores {
    type: string
    hidden: yes
    sql: dashboard_view__stores ;;
  }

  dimension: departments {
    hidden: yes
    sql: Departments ;;
  }

  dimension: store_name {
    type: string
    sql: StoreName ;;
  }
}

view: dashboard_view__stores__departments {
  dimension: amount_department {
    type: number
    sql: ${TABLE}.Amount_Department ;;
  }

  dimension: categories {
    hidden: yes
    sql: ${TABLE}.Categories ;;
  }

  dimension: department {
    type: string
    sql: ${TABLE}.Department ;;
  }
}

view: dashboard_view__stores__departments__categories {
  dimension: amount_category {
    type: number
    sql: ${TABLE}.Amount_Category ;;
  }

  dimension: category {
    type: string
    sql: ${TABLE}.Category ;;
  }

  dimension: products {
    hidden: yes
    sql: ${TABLE}.Products ;;
  }
}

view: dashboard_view__stores__departments__categories__products {
  dimension: amount_product {
    type: number
    sql: ${TABLE}.Amount_Product ;;
  }

  dimension: product_id {
    type: number
    sql: ${TABLE}.ProductID ;;
  }

  dimension: product_name {
    type: string
    sql: ${TABLE}.ProductName ;;
  }
}

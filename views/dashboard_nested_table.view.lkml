# Un-hide and use this explore, or copy the joins into another explore, to get all the fully nested relationships from this view
explore: dashboard_nested_table {
  hidden: no
    join: dashboard_nested_table__stores {
      view_label: "Dashboard Nested Table: Stores"
      sql: LEFT JOIN UNNEST(${dashboard_nested_table.stores}) as dashboard_nested_table__stores ;;
      relationship: one_to_many
    }
    join: dashboard_nested_table__stores__departments {
      view_label: "Dashboard Nested Table: Stores Departments"
      sql: LEFT JOIN UNNEST(${dashboard_nested_table__stores.departments}) as dashboard_nested_table__stores__departments ;;
      relationship: one_to_many
    }
    join: dashboard_nested_table__stores__departments__categories {
      view_label: "Dashboard Nested Table: Stores Departments Categories"
      sql: LEFT JOIN UNNEST(${dashboard_nested_table__stores__departments.categories}) as dashboard_nested_table__stores__departments__categories ;;
      relationship: one_to_many
    }
    join: dashboard_nested_table__stores__departments__categories__products {
      view_label: "Dashboard Nested Table: Stores Departments Categories Products"
      sql: LEFT JOIN UNNEST(${dashboard_nested_table__stores__departments__categories.products}) as dashboard_nested_table__stores__departments__categories__products ;;
      relationship: one_to_many
    }
}
view: dashboard_nested_table {
  sql_table_name: `bi4all-elt-framework-dev.BI4ALL_Training_prd.dashboard_nested_table` ;;

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
  }
}

view: dashboard_nested_table__stores {
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
  dimension: dashboard_nested_table__stores {
    type: string
    hidden: yes
    sql: dashboard_nested_table__stores ;;
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

view: dashboard_nested_table__stores__departments {

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

view: dashboard_nested_table__stores__departments__categories {

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

view: dashboard_nested_table__stores__departments__categories__products {

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

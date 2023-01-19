connection: "bi4all_training_prd"

# include all the views
include: "/views/**/*.view"

datagroup: bi4all_training_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: bi4all_training_default_datagroup

explore: prd_store {}

explore: dashboard_view {
  join: dashboard_view__stores {
    view_label: "Dashboard View: Stores"
    sql: LEFT JOIN UNNEST(${dashboard_view.stores}) as dashboard_view__stores ;;
    relationship: one_to_many
  }

  join: dashboard_view__stores__departments {
    view_label: "Dashboard View: Stores Departments"
    sql: LEFT JOIN UNNEST(${dashboard_view__stores.departments}) as dashboard_view__stores__departments ;;
    relationship: one_to_many
  }

  join: dashboard_view__stores__departments__categories {
    view_label: "Dashboard View: Stores Departments Categories"
    sql: LEFT JOIN UNNEST(${dashboard_view__stores__departments.categories}) as dashboard_view__stores__departments__categories ;;
    relationship: one_to_many
  }

  join: dashboard_view__stores__departments__categories__products {
    view_label: "Dashboard View: Stores Departments Categories Products"
    sql: LEFT JOIN UNNEST(${dashboard_view__stores__departments__categories.products}) as dashboard_view__stores__departments__categories__products ;;
    relationship: one_to_many
  }
}

explore: prd_sales {}

explore: opt_prd_customer_di_dynamic {}

explore: prd_customer {}

explore: prd_product {}

explore: opt_prd_customer_di_static {}

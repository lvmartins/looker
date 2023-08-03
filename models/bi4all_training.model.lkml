connection: "bi4all_training_prd"

# include all the views
include: "/views/**/*.view"

datagroup: bi4all_training_etl {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: bi4all_training_etl

explore: sales {
  label: "(1) Sales, Products and Customers"
  view_name:  sales

  join: products {
    type: left_outer
    view_label: "Products"
    relationship: many_to_one
    sql_on:  ${sales.product_id} = ${products.product_id} ;;
  }

  join: stores {
    type: inner
    view_label: "Stores"
    relationship: many_to_one
    sql_on:  ${sales.store_id} = ${stores.store_id} ;;
  }

  join: customers {
    type: full_outer
    view_label: "Customers"
    relationship: many_to_one
    sql_on:  ${sales.customer_id} = ${customers.customer_id} ;;
  }

  join: customer_sales_fct {
    type: left_outer
    view_label: "Customers Facts"
    relationship: many_to_one
    sql_on:  ${sales.customer_id} = ${customer_sales_fct.customer_id} ;;
  }
}


# explore: sales {}


# explore: customers {}

# explore: products {}



explore: dashboard_view {
  label: "(2) Country Metrics"
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



# explore: opt_prd_customer_di_dynamic {
#   hidden: yes
# }

# explore: opt_prd_customer_di_static {
#   hidden: yes
# }

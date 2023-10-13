# Un-hide and use this explore, or copy the joins into another explore, to get all the fully nested relationships from this view
explore: store_employees {
  hidden: no
    join: store_employees__employees {
      view_label: "Store Employees: Employees"
      sql: LEFT JOIN UNNEST(${store_employees.employees}) as store_employees__employees ;;
      relationship: one_to_many
    }
}
view: store_employees {
  sql_table_name: `bi4all-elt-framework-dev.BI4ALL_Training_prd.Store_Employees` ;;

  dimension: employees {
    hidden: yes
    sql: ${TABLE}.Employees ;;
  }
  dimension: store_id {
    type: number
    sql: ${TABLE}.Store_ID ;;
  }
  measure: count {
    type: count
  }
}

view: store_employees__employees {

  dimension: store_employees__employees {
    type: number
    sql: store_employees__employees ;;
  }
}

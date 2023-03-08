view: customer_sales_fct {

  derived_table: {
    sql:
      SELECT
          CustomerID
          , COUNT(DISTINCT SaleID) AS lifetime_orders
          , SUM(Amount) AS lifetime_revenue
          , CAST(MIN(CreationDateTime)  AS TIMESTAMP) AS first_order
          , CAST(MAX(CreationDateTime)  AS TIMESTAMP)  AS last_order
          --, COUNT(DISTINCT FORMAT_TIMESTAMP('%Y%m', created_at))  AS number_of_distinct_months_with_orders
          --, FIRST_VALUE(CONCAT(uniform(2, 9, random(1)),uniform(0, 9, random(2)),uniform(0, 9, random(3)),'-',uniform(0, 9, random(4)),uniform(0, 9, random(5)),uniform(0, 9, random(6)),'-',uniform(0, 9, random(7)),uniform(0, 9, random(8)),uniform(0, 9, random(9)),uniform(0, 9, random(10)))) OVER (PARTITION BY user_id ORDER BY user_id) AS phone_number
        FROM BI4ALL_Training_prd.prd_sales
        GROUP BY CustomerID
      ;;
      # datagroup_trigger: bi4all_training_etl
    }

  dimension: customer_id {
    label: "Customer ID"
    primary_key: yes
    type: number
    sql: ${TABLE}.customer_id ;;
  }


    dimension_group: first_order {
      label: "First Order"
      type: time
      timeframes: [date, week, month, year]
      sql: ${TABLE}.first_order;;
    }

    dimension_group: latest_order {
      label: "Latest Orders"
      type: time
      timeframes: [date, week, month, year]
      sql: ${TABLE}.last_order ;;
    }

    dimension: days_as_customer {
      label: "Days As Customer"
      description: "Days between first and latest order"
      type: number
      sql: TIMESTAMP_DIFF(${TABLE}.last_order, ${TABLE}.first_order, DAY)+1 ;;
    }

  dimension: days_as_customer_tiered {
    label: "Days as Customer Tiered"
    type: tier
    tiers: [0, 1, 7, 14, 21, 28, 30, 60, 90, 120]
    sql: ${days_as_customer} ;;
    style: integer
  }

  dimension: lifetime_orders {
    label: "Lifetime Orders"
    type: number
    sql: ${TABLE}.lifetime_orders ;;
  }

  dimension: repeat_customer {
    label: "Repeat Customer"
    description: "Lifetime Count of Orders > 1"
    type: yesno
    sql: ${lifetime_orders} > 1 ;;
  }

  dimension: lifetime_revenue {
    label: "Lifetime Revenue"
    type: number
    value_format_name: usd
    sql: ${TABLE}.lifetime_revenue ;;
  }


}

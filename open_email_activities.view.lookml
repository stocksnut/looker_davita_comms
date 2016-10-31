- view: open_email_activities
  derived_table:
    sql:  |
          SELECT
          activityid,
          campaignId,
          leadId,
          StepID,
          activityTypeId,
          Device,
          Platform,
          activityDate,
          IsMobileDevice
          FROM
          (TABLE_QUERY(davita_comms, 'table_id contains "openEmailActivities_"'))
  
  fields:

  - dimension: activity_id
    primary_key: true 
    type: string
    sql: ${TABLE}.activityId

  - dimension: activity_type_id
    type: string
    # hidden: true
    sql: ${TABLE}.activityTypeId

  - dimension: campaign_id
    type: string
    # hidden: true
    sql: ${TABLE}.campaignId

  - dimension: device
    type: string
    sql: ${TABLE}.Device

  - dimension: is_mobile_device
    type: string
    sql: ${TABLE}.IsMobileDevice

  - dimension: lead_id
    type: string
    # hidden: true
    sql: ${TABLE}.leadId

  - dimension_group: activity_date
    type: time
    timeframes: [date, month_name, month, day_of_week, day_of_week_index, hour]
    sql: ${TABLE}.activityDate
  
  - dimension: platform
    type: string
    sql: ${TABLE}.Platform

  - dimension: step_id
    type: string
    sql: ${TABLE}.StepID

  - measure: count
    type: count
    approximate_threshold: 100000
    drill_fields: detail*


  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - campaigns.campaignid
    - campaigns.program_name
    - campaigns.name
    - campaigns.workspace_name
    - leads.company_name
    - leads.first_name
    - leads.last_name
    - leads.lead_id
    - activity_types.name
    - activity_types.activity_type_id


# # You can specify the table name if it's different from the view name:
#   sql_table_name: my_schema_name.open_email_activities
#
#   fields:
# #     Define your dimensions and measures here, like this:
#     - dimension: id
#       description: "The unique ID for each order"
#       type: number
#       sql: ${TABLE}.id
#
#     - dimension_group: created
#       description: "Transaction created date"
#       type: time
#       timeframes: [date, week, month, year]
#       sql: ${TABLE}.created_at
#
#     - measure: count
#       description: "Count of orders"
#       type: count
#
#
# # Or, you could make this view a derived table, like this:
#   derived_table:
#     sql: |
#       SELECT
#         user_id as user_id
#         , COUNT(*) as lifetime_orders
#         , MAX(orders.created_at) as most_recent_purchase_at
#       FROM orders
#       GROUP BY user_id
#
#   fields:
# #     Define your dimensions and measures here, like this:
#     - dimension: user_id
#       description: "Unique ID for each user that has ordered"
#       type: number
#       sql: ${TABLE}.user_id
#
#     - dimension: lifetime_orders
#       description: "The total number of orders for each user"
#       type: number
#       sql: ${TABLE}.lifetime_orders
#
#     - dimension_group: most_recent_purchase
#       description: "The date when each user last ordered"
#       type: time
#       timeframes: [date, week, month, year]
#       sql: ${TABLE}.most_recent_purchase_at
#
#     - measure: total_lifetime_orders
#       description: "Use this for counting lifetime orders across many users"
#       type: sum
#       sql: ${lifetime_orders}

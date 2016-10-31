- view: send_email_activities_20161031
  sql_table_name: davita_comms.sendEmailActivities_20161031
  fields:

  - dimension_group: activity_date
    type: time
    timeframes: [date, month_name, day_of_week, hour]
    sql: ${TABLE}.activityDate
  
  - dimension: activity_id
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

  - dimension: lead_id
    type: string
    # hidden: true
    sql: ${TABLE}.leadId

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
    - activity_types.name
    - activity_types.activity_type_id
    - leads.company_name
    - leads.first_name
    - leads.last_name
    - leads.lead_id


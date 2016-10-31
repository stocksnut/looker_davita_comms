- view: activity_types
  sql_table_name: davita_comms.activityTypes
  fields:

  - dimension: activity_type_id
    primary_key: true
    type: string
    sql: ${TABLE}.activityTypeId

  - dimension: description
    type: string
    sql: ${TABLE}.description

  - dimension: name
    type: string
    sql: ${TABLE}.name

  - measure: count
    type: count
    approximate_threshold: 100000
    drill_fields: detail*


  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - activity_type_id
    - name
    - activities_tst.count
    - open_email_activities_20160229.count
    - open_email_activities_20160331.count
    - open_email_activities_20160430.count
    - open_email_activities_20160531.count
    - open_email_activities_20160630.count
    - open_email_activities_20160731.count
    - open_email_activities_20160831.count


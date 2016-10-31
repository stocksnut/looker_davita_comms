- connection: davita-comms-marketo

- include: "*.view.lookml"       # include all the views
- include: "*.dashboard.lookml"  # include all the dashboards

# NOTE: please see https://www.looker.com/docs/r/dialects/bigquery
# NOTE: for BigQuery specific considerations

- explore: activity_types

- explore: campaigns

- explore: leads

- explore: send_email_activities
  joins:
  - join:  open_email_activities
    type:  left_outer 
    relationship:  one_to_one 
    sql_on:  ${send_email_activities.activity_id} = ${open_email_activities.activity_id}
  - join:  campaigns
    type:  left_outer 
    relationship:  many_to_one 
    sql_on:  ${send_email_activities.campaign_id} = ${campaigns.campaign_id}
  - join:  leads
    type:  left_outer
    relationship:  many_to_one
    sql_on:  ${send_email_activities.lead_id} = ${leads.lead_id} 
  - join:  activity_types 
    type:  left_outer
    relationship:  many_to_one
    sql_on:  ${send_email_activities.activity_type_id} = ${activity_types.activity_type_id} 

- explore: open_email_activities
  joins:  
  - join:  campaigns
    type:  left_outer 
    relationship:  many_to_one 
    sql_on:  ${open_email_activities.campaign_id} = ${campaigns.campaign_id}
  - join:  leads
    type:  left_outer
    relationship:  many_to_one
    sql_on:  ${open_email_activities.lead_id} = ${leads.lead_id} 
  - join:  activity_types 
    type:  left_outer
    relationship:  many_to_one
    sql_on:  ${open_email_activities.activity_type_id} = ${activity_types.activity_type_id} 

- explore: send_email_activities_20161031
  joins:  
  - join:  campaigns
    type:  left_outer 
    relationship:  many_to_one 
    sql_on:  ${send_email_activities_20161031.campaign_id} = ${campaigns.campaign_id}
  - join:  leads
    type:  left_outer
    relationship:  many_to_one
    sql_on:  ${send_email_activities_20161031.lead_id} = ${leads.lead_id} 
  - join:  activity_types 
    type:  left_outer
    relationship:  many_to_one
    sql_on:  ${send_email_activities_20161031.activity_type_id} = ${activity_types.activity_type_id} 


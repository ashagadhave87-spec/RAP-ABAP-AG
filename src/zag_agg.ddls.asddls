@AbapCatalog.sqlViewName: 'ZAG_AGG1'
@AbapCatalog.compiler.compareFilter: true
//@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'aggrigration function'
@Metadata.ignorePropagatedAnnotations: true
define view zag_agg
  as select from /dmo/travel
{
  key travel_id                as travel_id,
      agency_id                as agency_id,
      'travel'                 as travel, // literal - Text
      40                       as Num, //literal- number
      $session.client          as user_name,
      $session.user            as users,
      $session.system_date     as dates,
      $session.system_language as languages,
      description              as description,

      case description
       when 'Vacation' then 'Holiday'
       when 'Business Trip for Christine, Pierre' then 'Business Trip'
       else 'other'
       end                     as new_des,

      case
      when description like 'Business Trip for Christine, Pierre' then 'Sad_holiday'
      else 'other'
      end                      as des1,

      case
      when total_price > 2500
      then 'More amount'
      when total_price >500 and total_price <=2500
      then 'Average'
      else'Less'
      end                      as Price




}

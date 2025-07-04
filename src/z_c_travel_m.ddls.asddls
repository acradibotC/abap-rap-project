@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumption view of Travel'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view entity Z_C_TRAVEL_M
provider contract transactional_query
 as projection on Z_I_TRAVEL_M
{
    @ObjectModel.text.element: [ 'Description' ]
    key TravelID,
    @Consumption.valueHelpDefinition: [{ entity: { name: '/DMO/I_Agency', element: 'AgencyID' } }]
    AgencyID,
    _agency.Name,
    @Consumption.valueHelpDefinition: [{ entity: { name: '/DMO/I_Customer', element: 'CustomerID' } }]
    CustomerID,
    _customer.FirstName,
    BeginDate,
    EndDate,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    BookingFee,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    TotalPrice,
    CurrencyCode,
    Description,
    @ObjectModel.text.element: [ 'statusText' ]
    OverallStatus,
    _overallStatus._Text.Text as statusText  : localized,
    CreatedBy,
    CreatedAt,
    LastChangedBy,
    LastChangedAt,
    /* Associations */
    _agency,
    _booking : redirected to composition child Z_C_BOOKING_M,
    _customer,
    _overallStatus
}

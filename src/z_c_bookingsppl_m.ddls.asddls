@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumption view of BookingSuppliment'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define view entity Z_C_BOOKINGSPPL_M as projection on Z_I_BOOKSUPPL_M
{
    key TravelID,
    key BookingID,
    key BookingSupplementID,
    SupplementID,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    Price,
    CurrencyCode,
    LastChangedAt,
    /* Associations */
    _booking : redirected to parent Z_C_BOOKING_M,
    _suppl,
    _supplText,
    _travel : redirected to Z_C_TRAVEL_M
}

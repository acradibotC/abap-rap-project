@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking Suppliments view'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity Z_I_BOOKSUPPL_M as select from /dmo/booksuppl_m


association to parent Z_I_BOOKING_M as _booking
on $projection.TravelID = _booking.TravelID
and $projection.BookingID = _booking.BookingID


association to Z_I_TRAVEL_M as _travel on $projection.TravelID = _travel.TravelID
association to /DMO/I_Supplement as _suppl on $projection.BookingSupplementID = _suppl.SupplementID
association to /DMO/I_SupplementText as _supplText on $projection.SupplementID = _supplText.SupplementID
{
    key travel_id             as TravelID,            // Số ID chuyến đi (Khóa)
    key booking_id            as BookingID,           // Số ID đặt chỗ (Khóa)
    key booking_supplement_id as BookingSupplementID, // Số ID dịch vụ bổ sung của đặt chỗ (Khóa)
    supplement_id             as SupplementID,        // Số ID dịch vụ bổ sung
    @Semantics.amount.currencyCode: 'CurrencyCode'   // Tham chiếu đến alias của currency_code
    price                     as Price,               // Giá của dịch vụ bổ sung
    currency_code             as CurrencyCode,        // Mã tiền tệ
    last_changed_at           as LastChangedAt,        // Thời điểm thay đổi cuối
    _booking,
    _suppl,
    _supplText,
    _travel
}

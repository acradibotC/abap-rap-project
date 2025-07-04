@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking CDS view'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
//query dữ liệu từ bảng
define view entity Z_I_BOOKING_M as select from /dmo/booking_m

//định nghĩa mối liên hệ tới cha là bảng TRAVEL
association to parent Z_I_TRAVEL_M as _travel
on $projection.TravelID = _travel.TravelID

//định nghĩa mối quan hệ tới con là bảng BOOKING SUPPLIMENT
composition[0..*] of Z_I_BOOKSUPPL_M as _booksuppl  


association to /DMO/I_Customer as _customer on $projection.CustomerID = _customer.CustomerID
association to /DMO/I_Carrier as _carrier on $projection.CarrierID = _carrier.AirlineID
association to /DMO/I_Connection as _connection on $projection.ConnectionID=_connection.ConnectionID
association to /DMO/I_Booking_Status_VH as _bookingStatus on $projection.BookingStatus = _bookingStatus.BookingStatus
{
    key travel_id      as TravelID,         // Số ID chuyến đi (Khóa)
    key booking_id     as BookingID,        // Số ID đặt chỗ (Khóa)
    booking_date       as BookingDate,      // Ngày đặt chỗ
    customer_id        as CustomerID,       // Số ID khách hàng
    carrier_id         as CarrierID,        // Mã hãng vận chuyển
    connection_id      as ConnectionID,     // Mã kết nối chuyến bay
    flight_date        as FlightDate,       // Ngày bay
    @Semantics.amount.currencyCode: 'CurrencyCode' // Tham chiếu đến alias của currency_code
    flight_price       as FlightPrice,      // Giá vé máy bay
    currency_code      as CurrencyCode,     // Mã tiền tệ
    booking_status     as BookingStatus,    // Trạng thái đặt chỗ
    last_changed_at    as LastChangedAt,     // Thời điểm thay đổi cuối
    _travel,              //lấy thông tin cha
    _booksuppl,           //lấy thông tin con
    _customer,            //lấy thông tin 
    _carrier,
    _connection,
    _bookingStatus
}

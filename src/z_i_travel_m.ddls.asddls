@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Root view entity for Travel'
@Metadata.ignorePropagatedAnnotations: true
define root view entity Z_I_TRAVEL_M as select from /dmo/travel_m

composition[0..*] of Z_I_BOOKING_M as _booking



association to /DMO/I_Agency as _agency on $projection.AgencyID = _agency.AgencyID
association to /DMO/I_Customer as _customer on $projection.CustomerID = _customer.CustomerID
association to /DMO/I_Overall_Status_VH as _overallStatus on $projection.OverallStatus = _overallStatus.OverallStatus
{
    key travel_id     as TravelID, // Số ID chuyến đi
    agency_id         as AgencyID, // Số ID đại lý
    customer_id       as CustomerID, // Số ID khách hàng
    begin_date        as BeginDate, // Ngày bắt đầu
    end_date          as EndDate, // Ngày kết thúc
    @Semantics.amount.currencyCode: 'CurrencyCode' // Tham chiếu đến alias của currency_code
    booking_fee       as BookingFee, // Phí đặt chỗ
    @Semantics.amount.currencyCode: 'CurrencyCode' // Tham chiếu đến alias của currency_code
    total_price       as TotalPrice, // Tổng giá
    @Semantics.baseUnitOfMeasure: true
    currency_code     as CurrencyCode, // Mã tiền tệ
    description       as Description, // Mô tả
    overall_status    as OverallStatus, // Trạng thái tổng thể
    created_by        as CreatedBy, // Người tạo
    created_at        as CreatedAt, // Thời điểm tạo
    last_changed_by   as LastChangedBy, // Người thay đổi cuối
    last_changed_at   as LastChangedAt, // Thời điểm thay đổi cuối
    _booking,
    _agency,
    _customer,
    _overallStatus
    
}

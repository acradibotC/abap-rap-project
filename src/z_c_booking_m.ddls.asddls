@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumption view of Booking'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define view entity Z_C_BOOKING_M
  as projection on Z_I_BOOKING_M
{
      @ObjectModel.text: {
          element: [ 'TravelDescription' ]
      }
  key TravelID,
  key BookingID,
      BookingDate,
      @ObjectModel.text: {
          element: [ 'CustName' ]
      }
      @Consumption.valueHelpDefinition: [{ entity: { name: '/DMO/I_Customer', element: 'CustomerID' } }]
      CustomerID,
      _customer.FirstName                  as CustName,
      @ObjectModel.text: {
          element: [ 'CarrierName' ]
      }
      @Consumption.valueHelpDefinition: [{ entity: { name: '/DMO/I_Carrier', element: 'AirlineID' } }]
      CarrierID,
      _carrier.Name                        as CarrierName,
      _travel.Description                  as TravelDescription,
       @Consumption.valueHelpDefinition: [{ entity: { name: '/DMO/I_Connection', element: 'ConnectionID' }, 
       additionalBinding: [{
           localElement: 'CarrierID',
           element: 'AirlineID'
       }] }]
      ConnectionID,
      @ObjectModel.text.element: [ 'DepartureCity' ]
      _connection.DepartureAirport         as DepartureAirport,
      _connection._DepartureAirport.City   as DepartureCity,
      @ObjectModel.text.element: [ 'DestinationCity' ]
      _connection.DestinationAirport       as DestinationAirport,
      _connection._DestinationAirport.City as DestinationCity,
      FlightDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      FlightPrice,
      CurrencyCode,
      @ObjectModel.text.element: [ 'statusText' ]
      @Consumption.valueHelpDefinition: [{ entity: { name: '/DMO/I_Booking_Status_VH', element: 'BookingStatus' } }]
      BookingStatus,
      _bookingStatus._Text.Text            as statusText : localized,
      LastChangedAt,
      /* Associations */
      _bookingStatus,
      _booksuppl : redirected to composition child Z_C_BOOKINGSPPL_M,
      _carrier,
      _connection,
      _customer,
      _travel    : redirected to parent Z_C_TRAVEL_M
}

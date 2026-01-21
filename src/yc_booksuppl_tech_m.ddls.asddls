@EndUserText.label: 'Booking Supp Projection View Manged'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
define view entity YC_BOOKSUPPL_TECH_M
  as projection on YI_BOOKSUPPL_TECH_M
{
  key TravelId,
  key BookingId,
  key BookingSupplementId,
      @ObjectModel.text.element: [ 'SupplemenDesc' ]
      SupplementId,
      _SupplementText.Description as SupplemenDesc : localized,
      Price,
      CurrencyCode,
      LastChangedAt,
      /* Associations */
      _Travel  : redirected to YC_TRAVEL_TECH_M,
      _Booking : redirected to parent YC_BOOKING_TECH_M,
      _Supplement,
      _SupplementText
}

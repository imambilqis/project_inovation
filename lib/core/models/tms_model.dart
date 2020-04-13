class PostTMSModel {
  final int shipmentTypeId;
  final int customerId;
  final int fleetId;
  final int driverId;
  final int paymentTypeId;
  final int cashbookId;
  final int productId;
  final String dateETD;
  final String dateETA;
  final int toId;
  final int fromId;

  PostTMSModel({
    this.shipmentTypeId,
    this.customerId,
    this.fleetId,
    this.driverId,
    this.paymentTypeId,
    this.cashbookId,
    this.productId,
    this.dateETD,
    this.dateETA,
    this.toId,
    this.fromId,
  });
}

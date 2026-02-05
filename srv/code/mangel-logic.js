/**
 * 
 * @On(event = { "UPDATE" }, entity = "accessPageSrv.Mangel")
 * @param {cds.Request} request - User information, tenant-specific CDS model, headers and query parameters
 * @param {Function} next - Callback function to the next handler
*/
module.exports = async function(request, next) {
  const { Mangel, Purchases } = cds.entities;

  // Extract the purchaseId from the Mangel record to be updated
  const { purchase_purchaseId } = request.data;

  // Ensure purchaseId is defined
  if (purchase_purchaseId === undefined) {
    return request.reject(400, 'Purchase ID must be provided.');
  }

  // Retrieve the associated Purchases record
  const purchaseRecord = await SELECT.one.from(Purchases).where({ purchaseId: purchase_purchaseId });

  // Ensure the Purchases record exists
  if (!purchaseRecord) {
    return request.reject(404, 'Purchases record not found.');
  }

  // Check if differenceQuantity is not 0
  const existingMangel = await SELECT.one.from(Mangel).where({ purchase_purchaseId });
  if (existingMangel && existingMangel.differenceQuantity === 0) {
    return request.reject(403, 'Mangel record with differenceQuantity 0 cannot be edited.');
  }

  // Proceed to the next handler
  return next();
}
namespace AccessPage;
using { cuid, Currency } from '@sap/cds/common';

@assert.unique: { buyersID: [buyersID] }
entity Buyers : cuid {
  buyersID: Integer @mandatory;
  name: String(100);
}

@assert.unique: { sellersID: [sellersID] }
entity Sellers : cuid {
  sellersID: Integer @mandatory;
  name: String(100);
  contactInfo: String(150);
  email: String(100);
  address: String(250);
  phone: String(20);
  taxInfo: String(100);
}

@assert.unique: { productId: [productId] }
entity Products : cuid {
  productId: Integer @mandatory;
  name: String(100);
  description: String(500);
  price: Decimal(10,2);
  Currency: Currency;
}

@assert.unique: { purchaseId: [purchaseId] }
entity Purchases : cuid {
  purchaseId: Association to PurchaseTokens @mandatory;
  quantity: Integer;
  date: Date;
  product: Association to Products;
  buyer: Association to Buyers;
  seller: Association to Sellers;
}

entity Mangel : cuid {
  istQuantity: Integer;
  differenceQuantity: Integer = (istQuantity - purchase.quantity) stored;
  purchase: Association to Purchases;
  product: Association to Products;
  ConfirmedQuantity: Integer;
}

@assert.unique: { token: [token] }
entity PurchaseTokens : cuid {
  token: String(100) @mandatory;
  expires_at: DateTime;
  revoked: Boolean;
  confirmed: Boolean;
  linkUsed: Boolean;
  created_on: DateTime;
  created_by: Association to Buyers;
}
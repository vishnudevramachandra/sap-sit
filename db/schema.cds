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
  purchaseId: Integer @mandatory;
  quantity: Integer;
  date: Date;
  product: Association to Products;
  buyer: Association to Buyers;
  seller: Association to Sellers;
}

entity Mangel : cuid {
  istQuantity: Integer;
  sollQuantity: Integer;
  differenceQuantity: Integer = (sollQuantity - istQuantity) stored;
  purchase: Association to Purchases;
  product: Association to Products;
}

@assert.unique: { token: [token] }
entity PurchaseTokens : cuid {
  token: String(100) @mandatory;
  purchaseId: Association to Purchases;
}
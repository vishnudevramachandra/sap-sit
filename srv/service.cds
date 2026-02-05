using { AccessPage as my } from '../db/schema.cds';

@path: '/service/accessPage'
@requires: 'authenticated-user'
service accessPageInternalSrv {
  entity Buyers as projection on my.Buyers;
  entity Sellers as projection on my.Sellers;
  entity Products as projection on my.Products;
  entity Purchases as projection on my.Purchases;
  entity Mangel as projection on my.Mangel;
  entity PurchaseTokens as projection on my.PurchaseTokens;
}

@path: '/service/accessPageExternal'
@requires: 'token-authenticated'
service accessPageExternalSrv {
  entity Products as projection on my.Products {
    productId,
    name,
    price,
    Currency
  };
  
  entity Mangel as projection on my.Mangel {
    istQuantity,
    sollQuantity,
    differenceQuantity
  };

  entity PurchaseTokens as projection on my.PurchaseTokens {
    token,
    purchaseId
  };
}

@path: '/service/tokenGeneration'
@requires: 'authenticated-user'
service tokenGenerationSrv {
  function generateToken(purchaseId: Integer) returns String;
}
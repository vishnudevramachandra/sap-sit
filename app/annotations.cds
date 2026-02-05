using { accessPageSrv } from '../srv/service.cds';

annotate accessPageSrv.Buyers with @UI.HeaderInfo: { TypeName: 'Buyer', TypeNamePlural: 'Buyers', Title: { Value: buyersID } };
annotate accessPageSrv.Buyers with {
  ID @UI.Hidden @Common.Text: { $value: buyersID, ![@UI.TextArrangement]: #TextOnly }
};
annotate accessPageSrv.Buyers with @UI.Identification: [{ Value: buyersID }];
annotate accessPageSrv.Buyers with {
  buyersID @title: 'ID';
  name @title: 'Name'
};

annotate accessPageSrv.Buyers with @UI.LineItem: [
 { $Type: 'UI.DataField', Value: buyersID },
 { $Type: 'UI.DataField', Value: name }
];

annotate accessPageSrv.Buyers with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
 { $Type: 'UI.DataField', Value: buyersID },
 { $Type: 'UI.DataField', Value: name }
  ]
};

annotate accessPageSrv.Buyers with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];

annotate accessPageSrv.Buyers with @UI.SelectionFields: [
  buyersID
];

annotate accessPageSrv.Sellers with @UI.HeaderInfo: { TypeName: 'Seller', TypeNamePlural: 'Sellers', Title: { Value: sellersID } };
annotate accessPageSrv.Sellers with {
  ID @UI.Hidden @Common.Text: { $value: sellersID, ![@UI.TextArrangement]: #TextOnly }
};
annotate accessPageSrv.Sellers with @UI.Identification: [{ Value: sellersID }];
annotate accessPageSrv.Sellers with {
  sellersID @title: 'ID';
  name @title: 'Name';
  contactInfo @title: 'Contact Info';
  email @title: 'Email';
  address @title: 'Address';
  phone @title: 'Phone';
  taxInfo @title: 'Tax Info'
};

annotate accessPageSrv.Sellers with @UI.LineItem: [
 { $Type: 'UI.DataField', Value: sellersID },
 { $Type: 'UI.DataField', Value: name },
 { $Type: 'UI.DataField', Value: contactInfo },
 { $Type: 'UI.DataField', Value: email },
 { $Type: 'UI.DataField', Value: address },
 { $Type: 'UI.DataField', Value: phone },
 { $Type: 'UI.DataField', Value: taxInfo }
];

annotate accessPageSrv.Sellers with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
 { $Type: 'UI.DataField', Value: sellersID },
 { $Type: 'UI.DataField', Value: name },
 { $Type: 'UI.DataField', Value: contactInfo },
 { $Type: 'UI.DataField', Value: email },
 { $Type: 'UI.DataField', Value: address },
 { $Type: 'UI.DataField', Value: phone },
 { $Type: 'UI.DataField', Value: taxInfo }
  ]
};

annotate accessPageSrv.Sellers with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];

annotate accessPageSrv.Sellers with @UI.SelectionFields: [
  sellersID
];

annotate accessPageSrv.Products with @UI.HeaderInfo: { TypeName: 'Product', TypeNamePlural: 'Products', Title: { Value: productId } };
annotate accessPageSrv.Products with {
  ID @UI.Hidden @Common.Text: { $value: productId, ![@UI.TextArrangement]: #TextOnly }
};
annotate accessPageSrv.Products with @UI.Identification: [{ Value: productId }];
annotate accessPageSrv.Products with {
  productId @title: 'Product ID';
  name @title: 'Name';
  description @title: 'Description';
  price @title: 'Price'
};

annotate accessPageSrv.Products with {
  price @Measures.ISOCurrency: Currency_code
};

annotate accessPageSrv.Products with @UI.LineItem: [
 { $Type: 'UI.DataField', Value: productId },
 { $Type: 'UI.DataField', Value: name },
 { $Type: 'UI.DataField', Value: description },
 { $Type: 'UI.DataField', Value: price }
];

annotate accessPageSrv.Products with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
 { $Type: 'UI.DataField', Value: productId },
 { $Type: 'UI.DataField', Value: name },
 { $Type: 'UI.DataField', Value: description },
 { $Type: 'UI.DataField', Value: price }
  ]
};

annotate accessPageSrv.Products with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];

annotate accessPageSrv.Products with @UI.SelectionFields: [
  productId
];

annotate accessPageSrv.Purchases with @UI.HeaderInfo: { TypeName: 'Purchase', TypeNamePlural: 'Purchases', Title: { Value: purchaseId } };
annotate accessPageSrv.Purchases with {
  ID @UI.Hidden @Common.Text: { $value: purchaseId, ![@UI.TextArrangement]: #TextOnly }
};
annotate accessPageSrv.Purchases with @UI.Identification: [{ Value: purchaseId }];
annotate accessPageSrv.Purchases with {
  product @Common.ValueList: {
    CollectionPath: 'Products',
    Parameters    : [
      {
        $Type            : 'Common.ValueListParameterInOut',
        LocalDataProperty: product_ID, 
        ValueListProperty: 'ID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'productId'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'name'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'description'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'price'
      },
    ],
  }
};
annotate accessPageSrv.Purchases with {
  buyer @Common.ValueList: {
    CollectionPath: 'Buyers',
    Parameters    : [
      {
        $Type            : 'Common.ValueListParameterInOut',
        LocalDataProperty: buyer_ID, 
        ValueListProperty: 'ID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'buyersID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'name'
      },
    ],
  }
};
annotate accessPageSrv.Purchases with {
  seller @Common.ValueList: {
    CollectionPath: 'Sellers',
    Parameters    : [
      {
        $Type            : 'Common.ValueListParameterInOut',
        LocalDataProperty: seller_ID, 
        ValueListProperty: 'ID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'sellersID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'name'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'contactInfo'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'email'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'address'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'phone'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'taxInfo'
      },
    ],
  }
};
annotate accessPageSrv.Purchases with {
  purchaseId @title: 'Purchase ID';
  quantity @title: 'Quantity';
  date @title: 'Date'
};

annotate accessPageSrv.Purchases with @UI.LineItem: [
 { $Type: 'UI.DataField', Value: purchaseId },
 { $Type: 'UI.DataField', Value: quantity },
 { $Type: 'UI.DataField', Value: date },
    { $Type: 'UI.DataField', Label: 'Product', Value: product_ID },
    { $Type: 'UI.DataField', Label: 'Buyer', Value: buyer_ID },
    { $Type: 'UI.DataField', Label: 'Seller', Value: seller_ID }
];

annotate accessPageSrv.Purchases with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
 { $Type: 'UI.DataField', Value: purchaseId },
 { $Type: 'UI.DataField', Value: quantity },
 { $Type: 'UI.DataField', Value: date },
    { $Type: 'UI.DataField', Label: 'Product', Value: product_ID },
    { $Type: 'UI.DataField', Label: 'Buyer', Value: buyer_ID },
    { $Type: 'UI.DataField', Label: 'Seller', Value: seller_ID }
  ]
};

annotate accessPageSrv.Purchases with {
  product @Common.Text: { $value: product.productId, ![@UI.TextArrangement]: #TextOnly };
  buyer @Common.Text: { $value: buyer.buyersID, ![@UI.TextArrangement]: #TextOnly };
  seller @Common.Text: { $value: seller.sellersID, ![@UI.TextArrangement]: #TextOnly }
};

annotate accessPageSrv.Purchases with {
  product @Common.Label: 'Product';
  buyer @Common.Label: 'Buyer';
  seller @Common.Label: 'Seller'
};

annotate accessPageSrv.Purchases with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];

annotate accessPageSrv.Purchases with @UI.SelectionFields: [
  product_ID,
  buyer_ID,
  seller_ID
];

annotate accessPageSrv.Mangel with @UI.HeaderInfo: { TypeName: 'Defect', TypeNamePlural: 'Defects' };
annotate accessPageSrv.Mangel with {
  purchase @Common.ValueList: {
    CollectionPath: 'Purchases',
    Parameters    : [
      {
        $Type            : 'Common.ValueListParameterInOut',
        LocalDataProperty: purchase_ID, 
        ValueListProperty: 'ID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'purchaseId'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'quantity'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'date'
      },
    ],
  }
};
annotate accessPageSrv.Mangel with {
  product @Common.ValueList: {
    CollectionPath: 'Products',
    Parameters    : [
      {
        $Type            : 'Common.ValueListParameterInOut',
        LocalDataProperty: product_ID, 
        ValueListProperty: 'ID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'productId'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'name'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'description'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'price'
      },
    ],
  }
};
annotate accessPageSrv.Mangel with {
  istQuantity @title: 'Ist Quantity';
  sollQuantity @title: 'Soll Quantity';
  differenceQuantity @title: 'Difference Quantity'
};

annotate accessPageSrv.Mangel with @UI.LineItem: [
 { $Type: 'UI.DataField', Value: istQuantity },
 { $Type: 'UI.DataField', Value: sollQuantity },
 { $Type: 'UI.DataField', Value: differenceQuantity },
    { $Type: 'UI.DataField', Label: 'Purchase', Value: purchase_ID },
    { $Type: 'UI.DataField', Label: 'Product', Value: product_ID }
];

annotate accessPageSrv.Mangel with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
 { $Type: 'UI.DataField', Value: istQuantity },
 { $Type: 'UI.DataField', Value: sollQuantity },
 { $Type: 'UI.DataField', Value: differenceQuantity },
    { $Type: 'UI.DataField', Label: 'Purchase', Value: purchase_ID },
    { $Type: 'UI.DataField', Label: 'Product', Value: product_ID }
  ]
};

annotate accessPageSrv.Mangel with {
  purchase @Common.Text: { $value: purchase.purchaseId, ![@UI.TextArrangement]: #TextOnly };
  product @Common.Text: { $value: product.productId, ![@UI.TextArrangement]: #TextOnly }
};

annotate accessPageSrv.Mangel with {
  purchase @Common.Label: 'Purchase';
  product @Common.Label: 'Product'
};

annotate accessPageSrv.Mangel with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];

annotate accessPageSrv.Mangel with @UI.SelectionFields: [
  purchase_ID,
  product_ID
];


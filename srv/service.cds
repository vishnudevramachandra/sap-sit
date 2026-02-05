using { AccessPage as my } from '../db/schema.cds';

@path: '/service/accessPage'
@requires: 'authenticated-user'
service accessPageSrv {
  @odata.draft.enabled
  entity Buyers as projection on my.Buyers;
  @odata.draft.enabled
  entity Sellers as projection on my.Sellers;
  @odata.draft.enabled
  entity Products as projection on my.Products;
  @odata.draft.enabled
  entity Purchases as projection on my.Purchases;
  @odata.draft.enabled
  entity Mangel as projection on my.Mangel;
}
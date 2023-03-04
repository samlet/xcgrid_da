import 'xcgrid_da.dart';
import 'xcrpc_api.dart';

import 'handle_proto.dart';
import 'agents.dart';
export 'agents.dart';


extension GlAccountCoEx on GlAccountCoHandle {
  GlAccountCoAgent get agent =>
      locator<XcClient>().glAccountCoAgent(bundleId, regionId: regionId);
}

extension SurveyPalEx on SurveyPalHandle {
  SurveyPalAgent get agent =>
      locator<XcClient>().surveyPalAgent(bundleId, regionId: regionId);
}

extension OrderEscrowCoEx on OrderEscrowCoHandle {
  OrderEscrowCoAgent get agent =>
      locator<XcClient>().orderEscrowCoAgent(bundleId, regionId: regionId);
}

extension WalletPalEx on WalletPalHandle {
  WalletPalAgent get agent =>
      locator<XcClient>().walletPalAgent(bundleId, regionId: regionId);
}

extension RealmPalEx on RealmPalHandle {
  RealmPalAgent get agent =>
      locator<XcClient>().realmPalAgent(bundleId, regionId: regionId);
}

extension CatalogAutoEx on CatalogAutoHandle {
  CatalogAutoAgent get agent =>
      locator<XcClient>().catalogAutoAgent(bundleId, regionId: regionId);
}

extension OrderEscrowPalEx on OrderEscrowPalHandle {
  OrderEscrowPalAgent get agent =>
      locator<XcClient>().orderEscrowPalAgent(bundleId, regionId: regionId);
}

extension EmailAddressAutoEx on EmailAddressAutoHandle {
  EmailAddressAutoAgent get agent =>
      locator<XcClient>().emailAddressAutoAgent(bundleId, regionId: regionId);
}

extension WebSiteAutoEx on WebSiteAutoHandle {
  WebSiteAutoAgent get agent =>
      locator<XcClient>().webSiteAutoAgent(bundleId, regionId: regionId);
}

extension UserLoginAutoEx on UserLoginAutoHandle {
  UserLoginAutoAgent get agent =>
      locator<XcClient>().userLoginAutoAgent(bundleId, regionId: regionId);
}

extension AudioAutoEx on AudioAutoHandle {
  AudioAutoAgent get agent =>
      locator<XcClient>().audioAutoAgent(bundleId, regionId: regionId);
}

extension SectionPalEx on SectionPalHandle {
  SectionPalAgent get agent =>
      locator<XcClient>().sectionPalAgent(bundleId, regionId: regionId);
}

extension DataResourceAutoEx on DataResourceAutoHandle {
  DataResourceAutoAgent get agent =>
      locator<XcClient>().dataResourceAutoAgent(bundleId, regionId: regionId);
}

extension PartyCoEx on PartyCoHandle {
  PartyCoAgent get agent =>
      locator<XcClient>().partyCoAgent(bundleId, regionId: regionId);
}

extension ShoppingCartAutoEx on ShoppingCartAutoHandle {
  ShoppingCartAutoAgent get agent =>
      locator<XcClient>().shoppingCartAutoAgent(bundleId, regionId: regionId);
}

extension Erc1155CoEx on Erc1155CoHandle {
  Erc1155CoAgent get agent =>
      locator<XcClient>().erc1155CoAgent(bundleId, regionId: regionId);
}

extension BlacklistCoEx on BlacklistCoHandle {
  BlacklistCoAgent get agent =>
      locator<XcClient>().blacklistCoAgent(bundleId, regionId: regionId);
}

extension CategoryCoEx on CategoryCoHandle {
  CategoryCoAgent get agent =>
      locator<XcClient>().categoryCoAgent(bundleId, regionId: regionId);
}

extension CorporationAutoEx on CorporationAutoHandle {
  CorporationAutoAgent get agent =>
      locator<XcClient>().corporationAutoAgent(bundleId, regionId: regionId);
}

extension BillboardAutoEx on BillboardAutoHandle {
  BillboardAutoAgent get agent =>
      locator<XcClient>().billboardAutoAgent(bundleId, regionId: regionId);
}

extension CarrierAutoEx on CarrierAutoHandle {
  CarrierAutoAgent get agent =>
      locator<XcClient>().carrierAutoAgent(bundleId, regionId: regionId);
}

extension ContactMechCoEx on ContactMechCoHandle {
  ContactMechCoAgent get agent =>
      locator<XcClient>().contactMechCoAgent(bundleId, regionId: regionId);
}

extension FacilityCoEx on FacilityCoHandle {
  FacilityCoAgent get agent =>
      locator<XcClient>().facilityCoAgent(bundleId, regionId: regionId);
}

extension ServerItemPalEx on ServerItemPalHandle {
  ServerItemPalAgent get agent =>
      locator<XcClient>().serverItemPalAgent(bundleId, regionId: regionId);
}

extension ApplicationSandboxAutoEx on ApplicationSandboxAutoHandle {
  ApplicationSandboxAutoAgent get agent =>
      locator<XcClient>().applicationSandboxAutoAgent(bundleId, regionId: regionId);
}

extension CarrierPalEx on CarrierPalHandle {
  CarrierPalAgent get agent =>
      locator<XcClient>().carrierPalAgent(bundleId, regionId: regionId);
}

extension DigitalStorePalEx on DigitalStorePalHandle {
  DigitalStorePalAgent get agent =>
      locator<XcClient>().digitalStorePalAgent(bundleId, regionId: regionId);
}

extension WorkEffortAutoEx on WorkEffortAutoHandle {
  WorkEffortAutoAgent get agent =>
      locator<XcClient>().workEffortAutoAgent(bundleId, regionId: regionId);
}

extension ProductCategoryAutoEx on ProductCategoryAutoHandle {
  ProductCategoryAutoAgent get agent =>
      locator<XcClient>().productCategoryAutoAgent(bundleId, regionId: regionId);
}

extension HeadlineAutoEx on HeadlineAutoHandle {
  HeadlineAutoAgent get agent =>
      locator<XcClient>().headlineAutoAgent(bundleId, regionId: regionId);
}

extension NftCoEx on NftCoHandle {
  NftCoAgent get agent =>
      locator<XcClient>().nftCoAgent(bundleId, regionId: regionId);
}

extension StoreAutoEx on StoreAutoHandle {
  StoreAutoAgent get agent =>
      locator<XcClient>().storeAutoAgent(bundleId, regionId: regionId);
}

extension PaymentMethodCoEx on PaymentMethodCoHandle {
  PaymentMethodCoAgent get agent =>
      locator<XcClient>().paymentMethodCoAgent(bundleId, regionId: regionId);
}

extension MultisigAutoEx on MultisigAutoHandle {
  MultisigAutoAgent get agent =>
      locator<XcClient>().multisigAutoAgent(bundleId, regionId: regionId);
}

extension OnlineStoreAutoEx on OnlineStoreAutoHandle {
  OnlineStoreAutoAgent get agent =>
      locator<XcClient>().onlineStoreAutoAgent(bundleId, regionId: regionId);
}

extension ProductCoEx on ProductCoHandle {
  ProductCoAgent get agent =>
      locator<XcClient>().productCoAgent(bundleId, regionId: regionId);
}

extension SalesOrderAutoEx on SalesOrderAutoHandle {
  SalesOrderAutoAgent get agent =>
      locator<XcClient>().salesOrderAutoAgent(bundleId, regionId: regionId);
}

extension AutoOrganPalEx on AutoOrganPalHandle {
  AutoOrganPalAgent get agent =>
      locator<XcClient>().autoOrganPalAgent(bundleId, regionId: regionId);
}

extension DigitalAssetPalEx on DigitalAssetPalHandle {
  DigitalAssetPalAgent get agent =>
      locator<XcClient>().digitalAssetPalAgent(bundleId, regionId: regionId);
}

extension PartyAutoEx on PartyAutoHandle {
  PartyAutoAgent get agent =>
      locator<XcClient>().partyAutoAgent(bundleId, regionId: regionId);
}

extension ContainerAutoEx on ContainerAutoHandle {
  ContainerAutoAgent get agent =>
      locator<XcClient>().containerAutoAgent(bundleId, regionId: regionId);
}

extension TextAutoEx on TextAutoHandle {
  TextAutoAgent get agent =>
      locator<XcClient>().textAutoAgent(bundleId, regionId: regionId);
}

extension CustRequestCoEx on CustRequestCoHandle {
  CustRequestCoAgent get agent =>
      locator<XcClient>().custRequestCoAgent(bundleId, regionId: regionId);
}

extension ProductAutoEx on ProductAutoHandle {
  ProductAutoAgent get agent =>
      locator<XcClient>().productAutoAgent(bundleId, regionId: regionId);
}

extension WorkEffortCoEx on WorkEffortCoHandle {
  WorkEffortCoAgent get agent =>
      locator<XcClient>().workEffortCoAgent(bundleId, regionId: regionId);
}

extension PurchaseOrderAutoEx on PurchaseOrderAutoHandle {
  PurchaseOrderAutoAgent get agent =>
      locator<XcClient>().purchaseOrderAutoAgent(bundleId, regionId: regionId);
}

extension NoteCoEx on NoteCoHandle {
  NoteCoAgent get agent =>
      locator<XcClient>().noteCoAgent(bundleId, regionId: regionId);
}

extension ComposableCoEx on ComposableCoHandle {
  ComposableCoAgent get agent =>
      locator<XcClient>().composableCoAgent(bundleId, regionId: regionId);
}

extension CustomerPalEx on CustomerPalHandle {
  CustomerPalAgent get agent =>
      locator<XcClient>().customerPalAgent(bundleId, regionId: regionId);
}

extension VideoAutoEx on VideoAutoHandle {
  VideoAutoAgent get agent =>
      locator<XcClient>().videoAutoAgent(bundleId, regionId: regionId);
}

extension BudgetCoEx on BudgetCoHandle {
  BudgetCoAgent get agent =>
      locator<XcClient>().budgetCoAgent(bundleId, regionId: regionId);
}

extension CatalogCoEx on CatalogCoHandle {
  CatalogCoAgent get agent =>
      locator<XcClient>().catalogCoAgent(bundleId, regionId: regionId);
}

extension OrderCoEx on OrderCoHandle {
  OrderCoAgent get agent =>
      locator<XcClient>().orderCoAgent(bundleId, regionId: regionId);
}

extension InteractBoxPalEx on InteractBoxPalHandle {
  InteractBoxPalAgent get agent =>
      locator<XcClient>().interactBoxPalAgent(bundleId, regionId: regionId);
}

extension ShoppingCartPalEx on ShoppingCartPalHandle {
  ShoppingCartPalAgent get agent =>
      locator<XcClient>().shoppingCartPalAgent(bundleId, regionId: regionId);
}

extension ContentAutoEx on ContentAutoHandle {
  ContentAutoAgent get agent =>
      locator<XcClient>().contentAutoAgent(bundleId, regionId: regionId);
}

extension MultisigPalEx on MultisigPalHandle {
  MultisigPalAgent get agent =>
      locator<XcClient>().multisigPalAgent(bundleId, regionId: regionId);
}

extension BillboardPalEx on BillboardPalHandle {
  BillboardPalAgent get agent =>
      locator<XcClient>().billboardPalAgent(bundleId, regionId: regionId);
}

extension ContentCoEx on ContentCoHandle {
  ContentCoAgent get agent =>
      locator<XcClient>().contentCoAgent(bundleId, regionId: regionId);
}

extension InventoryCoEx on InventoryCoHandle {
  InventoryCoAgent get agent =>
      locator<XcClient>().inventoryCoAgent(bundleId, regionId: regionId);
}

extension PipelinePalEx on PipelinePalHandle {
  PipelinePalAgent get agent =>
      locator<XcClient>().pipelinePalAgent(bundleId, regionId: regionId);
}

extension PresetSessionAutoEx on PresetSessionAutoHandle {
  PresetSessionAutoAgent get agent =>
      locator<XcClient>().presetSessionAutoAgent(bundleId, regionId: regionId);
}

extension UserLoginCoEx on UserLoginCoHandle {
  UserLoginCoAgent get agent =>
      locator<XcClient>().userLoginCoAgent(bundleId, regionId: regionId);
}

extension ShoppingListAutoEx on ShoppingListAutoHandle {
  ShoppingListAutoAgent get agent =>
      locator<XcClient>().shoppingListAutoAgent(bundleId, regionId: regionId);
}

extension ImageAutoEx on ImageAutoHandle {
  ImageAutoAgent get agent =>
      locator<XcClient>().imageAutoAgent(bundleId, regionId: regionId);
}

extension InvoiceCoEx on InvoiceCoHandle {
  InvoiceCoAgent get agent =>
      locator<XcClient>().invoiceCoAgent(bundleId, regionId: regionId);
}

extension PostalAddressAutoEx on PostalAddressAutoHandle {
  PostalAddressAutoAgent get agent =>
      locator<XcClient>().postalAddressAutoAgent(bundleId, regionId: regionId);
}

extension ContactMechAutoEx on ContactMechAutoHandle {
  ContactMechAutoAgent get agent =>
      locator<XcClient>().contactMechAutoAgent(bundleId, regionId: regionId);
}

extension InventoryAutoEx on InventoryAutoHandle {
  InventoryAutoAgent get agent =>
      locator<XcClient>().inventoryAutoAgent(bundleId, regionId: regionId);
}

extension ProductFeatureCategoryCoEx on ProductFeatureCategoryCoHandle {
  ProductFeatureCategoryCoAgent get agent =>
      locator<XcClient>().productFeatureCategoryCoAgent(bundleId, regionId: regionId);
}

extension FixedAssetAutoEx on FixedAssetAutoHandle {
  FixedAssetAutoAgent get agent =>
      locator<XcClient>().fixedAssetAutoAgent(bundleId, regionId: regionId);
}

extension CrowdFundingCoEx on CrowdFundingCoHandle {
  CrowdFundingCoAgent get agent =>
      locator<XcClient>().crowdFundingCoAgent(bundleId, regionId: regionId);
}

extension TicketAutoEx on TicketAutoHandle {
  TicketAutoAgent get agent =>
      locator<XcClient>().ticketAutoAgent(bundleId, regionId: regionId);
}

extension SectionAutoEx on SectionAutoHandle {
  SectionAutoAgent get agent =>
      locator<XcClient>().sectionAutoAgent(bundleId, regionId: regionId);
}

extension ShipmentCoEx on ShipmentCoHandle {
  ShipmentCoAgent get agent =>
      locator<XcClient>().shipmentCoAgent(bundleId, regionId: regionId);
}

extension FinAccountCoEx on FinAccountCoHandle {
  FinAccountCoAgent get agent =>
      locator<XcClient>().finAccountCoAgent(bundleId, regionId: regionId);
}

extension AuctionPalEx on AuctionPalHandle {
  AuctionPalAgent get agent =>
      locator<XcClient>().auctionPalAgent(bundleId, regionId: regionId);
}

extension TelecomNumberAutoEx on TelecomNumberAutoHandle {
  TelecomNumberAutoAgent get agent =>
      locator<XcClient>().telecomNumberAutoAgent(bundleId, regionId: regionId);
}

extension PaymentCoEx on PaymentCoHandle {
  PaymentCoAgent get agent =>
      locator<XcClient>().paymentCoAgent(bundleId, regionId: regionId);
}

extension OnlineStoreCoEx on OnlineStoreCoHandle {
  OnlineStoreCoAgent get agent =>
      locator<XcClient>().onlineStoreCoAgent(bundleId, regionId: regionId);
}

extension WebSiteCoEx on WebSiteCoHandle {
  WebSiteCoAgent get agent =>
      locator<XcClient>().webSiteCoAgent(bundleId, regionId: regionId);
}

extension EmplPositionCoEx on EmplPositionCoHandle {
  EmplPositionCoAgent get agent =>
      locator<XcClient>().emplPositionCoAgent(bundleId, regionId: regionId);
}

extension PartyGroupAutoEx on PartyGroupAutoHandle {
  PartyGroupAutoAgent get agent =>
      locator<XcClient>().partyGroupAutoAgent(bundleId, regionId: regionId);
}

extension ClassifiedPalEx on ClassifiedPalHandle {
  ClassifiedPalAgent get agent =>
      locator<XcClient>().classifiedPalAgent(bundleId, regionId: regionId);
}

extension FacilityAutoEx on FacilityAutoHandle {
  FacilityAutoAgent get agent =>
      locator<XcClient>().facilityAutoAgent(bundleId, regionId: regionId);
}

extension MoneyCoEx on MoneyCoHandle {
  MoneyCoAgent get agent =>
      locator<XcClient>().moneyCoAgent(bundleId, regionId: regionId);
}

extension ChainPalEx on ChainPalHandle {
  ChainPalAgent get agent =>
      locator<XcClient>().chainPalAgent(bundleId, regionId: regionId);
}

extension ExampleCoEx on ExampleCoHandle {
  ExampleCoAgent get agent =>
      locator<XcClient>().exampleCoAgent(bundleId, regionId: regionId);
}

extension AccountCoEx on AccountCoHandle {
  AccountCoAgent get agent =>
      locator<XcClient>().accountCoAgent(bundleId, regionId: regionId);
}

extension PipelineAutoEx on PipelineAutoHandle {
  PipelineAutoAgent get agent =>
      locator<XcClient>().pipelineAutoAgent(bundleId, regionId: regionId);
}

extension ApplicationSandboxPalEx on ApplicationSandboxPalHandle {
  ApplicationSandboxPalAgent get agent =>
      locator<XcClient>().applicationSandboxPalAgent(bundleId, regionId: regionId);
}

extension DataResourceCoEx on DataResourceCoHandle {
  DataResourceCoAgent get agent =>
      locator<XcClient>().dataResourceCoAgent(bundleId, regionId: regionId);
}

extension SlotCoEx on SlotCoHandle {
  SlotCoAgent get agent =>
      locator<XcClient>().slotCoAgent(bundleId, regionId: regionId);
}

extension StoreCoEx on StoreCoHandle {
  StoreCoAgent get agent =>
      locator<XcClient>().storeCoAgent(bundleId, regionId: regionId);
}

extension SupplierAutoEx on SupplierAutoHandle {
  SupplierAutoAgent get agent =>
      locator<XcClient>().supplierAutoAgent(bundleId, regionId: regionId);
}

extension OrderAutoEx on OrderAutoHandle {
  OrderAutoAgent get agent =>
      locator<XcClient>().orderAutoAgent(bundleId, regionId: regionId);
}

extension NoteAutoEx on NoteAutoHandle {
  NoteAutoAgent get agent =>
      locator<XcClient>().noteAutoAgent(bundleId, regionId: regionId);
}

extension ShipmentAutoEx on ShipmentAutoHandle {
  ShipmentAutoAgent get agent =>
      locator<XcClient>().shipmentAutoAgent(bundleId, regionId: regionId);
}

extension BillingAccountCoEx on BillingAccountCoHandle {
  BillingAccountCoAgent get agent =>
      locator<XcClient>().billingAccountCoAgent(bundleId, regionId: regionId);
}

extension AutoOrganAutoEx on AutoOrganAutoHandle {
  AutoOrganAutoAgent get agent =>
      locator<XcClient>().autoOrganAutoAgent(bundleId, regionId: regionId);
}

extension PreferenceAutoEx on PreferenceAutoHandle {
  PreferenceAutoAgent get agent =>
      locator<XcClient>().preferenceAutoAgent(bundleId, regionId: regionId);
}

extension PersonAutoEx on PersonAutoHandle {
  PersonAutoAgent get agent =>
      locator<XcClient>().personAutoAgent(bundleId, regionId: regionId);
}

extension TicketPalEx on TicketPalHandle {
  TicketPalAgent get agent =>
      locator<XcClient>().ticketPalAgent(bundleId, regionId: regionId);
}




 
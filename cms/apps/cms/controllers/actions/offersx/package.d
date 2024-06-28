module apps.cms.controllers.actions.offersx;

@safe:
import colored;
import apps.cms;
/* import apps.cms.settings.offers;
import models.cms.entities.offer; */

/* void uimOffersCreateAction(HTTPServerRequest req, HTTPServerResponse res) {
  debugMethodCall(moduleName!uimOffersCreateAction~":uimOffersCreateAction");

  auto action = CMSAction_CreateOffer(thisServer);
  action.request(req, res);
}

void uimOffersUpdateAction(HTTPServerRequest req, HTTPServerResponse res) {
  debugMethodCall(moduleName!uimOffersUpdateAction~":uimOffersUpdateAction");

  auto action = CMSAction_UpdateOffer(thisServer);
  action.request(req, res);
}

void uimOffersDeleteAction(HTTPServerRequest req, HTTPServerResponse res) {
  debugMethodCall(moduleName!uimOffersDeleteAction~":uimOffersDeleteAction");

  auto action = CMSAction_DeleteOffer(thisServer);
  action.request(req, res);
} */
/* mixin(ActionCalls!("uimOffers", "CMSOffer", "thisServer")); */
/* class DCMSOfferAction : DCMSAction {
  this() { super(); 
    this
    .rootPath("/cms/offers") 
    .collectionName("offers"); } 
}

class DCMSAction_CreateOffer : DCMSOfferAction {
  this() { super(); } 

  override bool beforeResponse(STRINGAA options = null) {
    debug writeln(StyledString(moduleName!DCMSAction_CreateOffer~":DCMSAction_CreateOffer::beforeResponse").setForeground(AnsiColor.black).setBackground(AnsiColor.white));
    super.beforeResponse(options);
    if ("redirect" in options) return;    

    auto appSession = getAppSession(options);

    auto entity = CMSOffer;
    entity.fromRequest(options);  
    database[appSession.site.name, myCollectionName].insertOne(entity);

    options["redirect"] = myPath~"/view?id="~entity.id.toString; 
	}
}
auto CMSAction_CreateOffer() { return new DCMSAction_CreateOffer; }

void uimOffersCreateAction(HTTPServerRequest req, HTTPServerResponse res) {
  debugMethodCall(moduleName!uimOffersCreateAction~":uimOffersCreateAction");

  auto action = CMSAction_CreateOffer;
  action.request(req, res);
}

class DCMSAction_UpdateOffer : DCMSOfferAction {
  this() { super(); } 

  override bool beforeResponse(STRINGAA options = null) {
    debug writeln(StyledString(moduleName!DCMSAction_UpdateOffer~":DCMSAction_UpdateOffer::beforeResponse").setForeground(AnsiColor.black).setBackground(AnsiColor.white));
    super.beforeResponse(options);
    if ("redirect" in options) return;     

    auto appSession = getAppSession(options);

    auto entity = CMSOffer.fromRequest(options);  
    database[appSession.site.name, myCollectionName].updateOne(entity);

    options["redirect"] = myPath~"/view?id="~entity.id.toString;
	}
}
auto CMSAction_UpdateOffer() { return new DCMSAction_UpdateOffer; }

void uimOffersUpdateAction(HTTPServerRequest req, HTTPServerResponse res) {
  debugMethodCall(moduleName!uimOffersUpdateAction~":uimOffersUpdateAction");

  auto action = CMSAction_UpdateOffer;
  action.request(req, res);
}

class DCMSAction_DeleteOffer : DCMSOfferAction {
  this() { super(); } 

  override bool beforeResponse(STRINGAA options = null) {
    debug writeln(StyledString(moduleName!DCMSAction_DeleteOffer~":DCMSAction_DeleteOffer::beforeResponse").setForeground(AnsiColor.black).setBackground(AnsiColor.white));
    super.beforeResponse(options);
    if ("redirect" in options) return;    

    auto appSession = getAppSession(options);

    auto entity = CMSOffer.fromRequest(options);  
    database[appSession.site.name, myCollectionName].removeOne(entity);

    options["redirect"] = myPath;
	}
}
auto CMSAction_DeleteOffer() { return new DCMSAction_DeleteOffer; }

void uimOffersDeleteAction(HTTPServerRequest req, HTTPServerResponse res) {
  debugMethodCall(moduleName!uimOffersDeleteAction~":uimOffersDeleteAction");

  auto action = CMSAction_DeleteOffer;
  action.request(req, res);
}
 */
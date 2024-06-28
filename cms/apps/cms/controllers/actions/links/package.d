module apps.cms.controllers.actions.links;

import apps.cms;
@safe:
/* import apps.cms.settings.links;
import models.cms.entities.link; */

/* void uimLinksCreateAction(HTTPServerRequest req, HTTPServerResponse res) {
  debugMethodCall(moduleName!uimLinksCreateAction~":uimLinksCreateAction");

  auto action = CMSAction_CreateLink(thisServer);
  action.request(req, res);
}

void uimLinksUpdateAction(HTTPServerRequest req, HTTPServerResponse res) {
  debugMethodCall(moduleName!uimLinksUpdateAction~":uimLinksUpdateAction");

  auto action = CMSAction_UpdateLink(thisServer);
  action.request(req, res);
}

void uimLinksDeleteAction(HTTPServerRequest req, HTTPServerResponse res) {
  debugMethodCall(moduleName!uimLinksDeleteAction~":uimLinksDeleteAction");

  auto action = CMSAction_DeleteLink(thisServer);
  action.request(req, res);
} */

/* mixin(ActionCalls!("uimLinks", "CMSLink", "thisServer")); */
/* class DCMSLinkAction : DCMSAction {
  this() { super(); 
    this
    .rootPath("/cms/links") 
    .collectionName("links"); } 
}

class DCMSAction_CreateLink : DCMSLinkAction {
  this() { super(); } 

  override bool beforeResponse(STRINGAA options = null) {
    debug writeln(StyledString(moduleName!DCMSAction_CreateLink~":DCMSAction_CreateLink::beforeResponse").setForeground(AnsiColor.black).setBackground(AnsiColor.white));
    super.beforeResponse(options);
    if ("redirect" in options) return;    

    auto appSession = getAppSession(options);

    auto entity = CMSLink;
    entity.fromRequest(options);  
    database[appSession.site.name, myCollectionName].insertOne(entity);

    options["redirect"] = myPath~"/view?id="~entity.id.toString; 
	}
}
auto CMSAction_CreateLink() { return new DCMSAction_CreateLink; }

void uimLinksCreateAction(HTTPServerRequest req, HTTPServerResponse res) {
  debugMethodCall(moduleName!uimLinksCreateAction~":uimLinksCreateAction");

  auto action = CMSAction_CreateLink;
  action.request(req, res);
}

class DCMSAction_UpdateLink : DCMSLinkAction {
  this() { super(); } 

  override bool beforeResponse(STRINGAA options = null) {
    debug writeln(StyledString(moduleName!DCMSAction_UpdateLink~":DCMSAction_UpdateLink::beforeResponse").setForeground(AnsiColor.black).setBackground(AnsiColor.white));
    super.beforeResponse(options);
    if ("redirect" in options) return;     

    auto appSession = getAppSession(options);

    auto entity = CMSLink.fromRequest(options);  
    database[appSession.site.name, myCollectionName].updateOne(entity);

    options["redirect"] = myPath~"/view?id="~entity.id.toString;
	}
}
auto CMSAction_UpdateLink() { return new DCMSAction_UpdateLink; }

void uimLinksUpdateAction(HTTPServerRequest req, HTTPServerResponse res) {
  debugMethodCall(moduleName!uimLinksUpdateAction~":uimLinksUpdateAction");

  auto action = CMSAction_UpdateLink;
  action.request(req, res);
}

class DCMSAction_DeleteLink : DCMSLinkAction {
  this() { super(); } 

  override bool beforeResponse(STRINGAA options = null) {
    debug writeln(StyledString(moduleName!DCMSAction_DeleteLink~":DCMSAction_DeleteLink::beforeResponse").setForeground(AnsiColor.black).setBackground(AnsiColor.white));
    super.beforeResponse(options);
    if ("redirect" in options) return;    

    auto appSession = getAppSession(options);

    auto entity = CMSLink.fromRequest(options);  
    database[appSession.site.name, myCollectionName].removeOne(entity);

    options["redirect"] = myPath;
	}
}
auto CMSAction_DeleteLink() { return new DCMSAction_DeleteLink; }

void uimLinksDeleteAction(HTTPServerRequest req, HTTPServerResponse res) {
  debugMethodCall(moduleName!uimLinksDeleteAction~":uimLinksDeleteAction");

  auto action = CMSAction_DeleteLink;
  action.request(req, res);
}
 */
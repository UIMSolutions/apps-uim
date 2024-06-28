module apps.cms.controllers.actions.pages;

import apps.cms;
@safe:
/* import apps.cms.settings.pages;
import models.cms.entities.page; */

/* void uimPagesCreateAction(HTTPServerRequest req, HTTPServerResponse res) {
  debugMethodCall(moduleName!uimPagesCreateAction~":uimPagesCreateAction");

  auto action = CMSAction_CreatePage(thisServer);
  action.request(req, res);
}

void uimPagesUpdateAction(HTTPServerRequest req, HTTPServerResponse res) {
  debugMethodCall(moduleName!uimPagesUpdateAction~":uimPagesUpdateAction");

  auto action = CMSAction_UpdatePage(thisServer);
  action.request(req, res);
}

void uimPagesDeleteAction(HTTPServerRequest req, HTTPServerResponse res) {
  debugMethodCall(moduleName!uimPagesDeleteAction~":uimPagesDeleteAction");

  auto action = CMSAction_DeletePage(thisServer);
  action.request(req, res);
} */
// mixin(ActionCalls!("uimPages", "CMSPage", "thisServer"));
/* class DCMSPageAction : DCMSAction {
  this() { super(); 
    this
    .rootPath("/cms/pages") 
    .collectionName("pages"); } 
}

class DCMSAction_CreatePage : DCMSPageAction {
  this() { super(); } 

  override bool beforeResponse(STRINGAA options = null) {
    debug writeln(StyledString(moduleName!DCMSAction_CreatePage~":DCMSAction_CreatePage::beforeResponse").setForeground(AnsiColor.black).setBackground(AnsiColor.white));
    super.beforeResponse(options);
    if ("redirect" in options) return;    

    auto appSession = getAppSession(options);

    auto entity = CMSPage;
    entity.fromRequest(options);  
    database[appSession.site.name, myCollectionName].insertOne(entity);

    options["redirect"] = myPath~"/view?id="~entity.id.toString; 
	}
}
auto CMSAction_CreatePage() { return new DCMSAction_CreatePage; }

void uimPagesCreateAction(HTTPServerRequest req, HTTPServerResponse res) {
  debugMethodCall(moduleName!uimPagesCreateAction~":uimPagesCreateAction");

  auto action = CMSAction_CreatePage;
  action.request(req, res);
}

class DCMSAction_UpdatePage : DCMSPageAction {
  this() { super(); } 

  override bool beforeResponse(STRINGAA options = null) {
    debug writeln(StyledString(moduleName!DCMSAction_UpdatePage~":DCMSAction_UpdatePage::beforeResponse").setForeground(AnsiColor.black).setBackground(AnsiColor.white));
    super.beforeResponse(options);
    if ("redirect" in options) return;     

    auto appSession = getAppSession(options);

    auto entity = CMSPage.fromRequest(options);  
    database[appSession.site.name, myCollectionName].updateOne(entity);

    options["redirect"] = myPath~"/view?id="~entity.id.toString;
	}
}
auto CMSAction_UpdatePage() { return new DCMSAction_UpdatePage; }

void uimPagesUpdateAction(HTTPServerRequest req, HTTPServerResponse res) {
  debugMethodCall(moduleName!uimPagesUpdateAction~":uimPagesUpdateAction");

  auto action = CMSAction_UpdatePage;
  action.request(req, res);
}

class DCMSAction_DeletePage : DCMSPageAction {
  this() { super(); } 

  override bool beforeResponse(STRINGAA options = null) {
    debug writeln(StyledString(moduleName!DCMSAction_DeletePage~":DCMSAction_DeletePage::beforeResponse").setForeground(AnsiColor.black).setBackground(AnsiColor.white));
    super.beforeResponse(options);
    if ("redirect" in options) return;    

    auto appSession = getAppSession(options);

    auto entity = CMSPage.fromRequest(options);  
    database[appSession.site.name, myCollectionName].removeOne(entity);

    options["redirect"] = myPath;
	}
}
auto CMSAction_DeletePage() { return new DCMSAction_DeletePage; }

void uimPagesDeleteAction(HTTPServerRequest req, HTTPServerResponse res) {
  debugMethodCall(moduleName!uimPagesDeleteAction~":uimPagesDeleteAction");

  auto action = CMSAction_DeletePage;
  action.request(req, res);
}
 */
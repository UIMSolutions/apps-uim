module apps.cms.controllers.actions.newsx;

import apps.cms;
@safe:
/* import apps.cms.settings.news;
import models.cms.entities.news;  */

/* void uimNewsCreateAction(HTTPServerRequest req, HTTPServerResponse res) {
  debugMethodCall(moduleName!uimNewsCreateAction~":uimNewsCreateAction");

  auto action = CMSAction_CreateNews(thisServer);
  action.request(req, res);
}

void uimNewsUpdateAction(HTTPServerRequest req, HTTPServerResponse res) {
  debugMethodCall(moduleName!uimNewsUpdateAction~":uimNewsUpdateAction");

  auto action = CMSAction_UpdateNews(thisServer);
  action.request(req, res);
}

void uimNewsDeleteAction(HTTPServerRequest req, HTTPServerResponse res) {
  debugMethodCall(moduleName!uimNewsDeleteAction~":uimNewsDeleteAction");

  auto action = CMSAction_DeleteNews(thisServer);
  action.request(req, res);
} */

/* mixin(ActionCalls!("uimNews", "CMSNews", "thisServer")); */
/* class DCMSNewsAction : DCMSAction {
  this() { super(); 
    this
    .rootPath("/cms/news") 
    .collectionName("news"); } 
}

class DCMSAction_CreateNews : DCMSNewsAction {
  this() { super(); } 

  override bool beforeResponse(STRINGAA options = null) {
    debug writeln(StyledString(moduleName!DCMSAction_CreateNews~":DCMSAction_CreateNews::beforeResponse").setForeground(AnsiColor.black).setBackground(AnsiColor.white));
    super.beforeResponse(options);
    if ("redirect" in options) return;    

    auto appSession = getAppSession(options);

    auto entity = CMSNewsItem;
    entity.fromRequest(options);  
    database[appSession.site.name, myCollectionName].insertOne(entity);

    options["redirect"] = myPath~"/view?id="~entity.id.toString; 
	}
}
auto CMSAction_CreateNews() { return new DCMSAction_CreateNews; }

void uimNewsCreateAction(HTTPServerRequest req, HTTPServerResponse res) {
  debugMethodCall(moduleName!uimNewsCreateAction~":uimNewsCreateAction");

  auto action = CMSAction_CreateNews;
  action.request(req, res);
}

class DCMSAction_UpdateNews : DCMSNewsAction {
  this() { super(); } 

  override bool beforeResponse(STRINGAA options = null) {
    debug writeln(StyledString(moduleName!DCMSAction_UpdateNews~":DCMSAction_UpdateNews::beforeResponse").setForeground(AnsiColor.black).setBackground(AnsiColor.white));
    super.beforeResponse(options);
    if ("redirect" in options) return;     

    auto appSession = getAppSession(options);

    auto entity = CMSNewsItem.fromRequest(options);  
    database[appSession.site.name, myCollectionName].updateOne(entity);

    options["redirect"] = myPath~"/view?id="~entity.id.toString;
	}
}
auto CMSAction_UpdateNews() { return new DCMSAction_UpdateNews; }

void uimNewsUpdateAction(HTTPServerRequest req, HTTPServerResponse res) {
  debugMethodCall(moduleName!uimNewsUpdateAction~":uimNewsUpdateAction");

  auto action = CMSAction_UpdateNews;
  action.request(req, res);
}

class DCMSAction_DeleteNews : DCMSNewsAction {
  this() { super(); } 

  override bool beforeResponse(STRINGAA options = null) {
    debug writeln(StyledString(moduleName!DCMSAction_DeleteNews~":DCMSAction_DeleteNews::beforeResponse").setForeground(AnsiColor.black).setBackground(AnsiColor.white));
    super.beforeResponse(options);
    if ("redirect" in options) return;    

    auto appSession = getAppSession(options);

    auto entity = CMSNewsItem.fromRequest(options);  
    database[appSession.site.name, myCollectionName].removeOne(entity);

    options["redirect"] = myPath;
	}
}
auto CMSAction_DeleteNews() { return new DCMSAction_DeleteNews; }

void uimNewsDeleteAction(HTTPServerRequest req, HTTPServerResponse res) {
  debugMethodCall(moduleName!uimNewsDeleteAction~":uimNewsDeleteAction");

  auto action = CMSAction_DeleteNews;
  action.request(req, res);
} */

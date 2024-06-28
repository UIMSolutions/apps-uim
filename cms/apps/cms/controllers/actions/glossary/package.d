module apps.cms.controllers.actions.glossary;

import apps.cms;
@safe:
/* import apps.cms.settings.glossary;
import models.cms.entities.glossary_item; */

/* void uimGlossaryCreateAction(HTTPServerRequest req, HTTPServerResponse res) {
  debugMethodCall(moduleName!uimGlossaryCreateAction~":uimGlossaryCreateAction");

  auto action = CMSAction_CreateGlossary(thisServer);
  action.request(req, res);
}

void uimGlossaryUpdateAction(HTTPServerRequest req, HTTPServerResponse res) {
  debugMethodCall(moduleName!uimGlossaryUpdateAction~":uimGlossaryUpdateAction");

  auto action = CMSAction_UpdateGlossary(thisServer);
  action.request(req, res);
}

void uimGlossaryDeleteAction(HTTPServerRequest req, HTTPServerResponse res) {
  debugMethodCall(moduleName!uimGlossaryDeleteAction~":uimGlossaryDeleteAction");

  auto action = CMSAction_DeleteGlossary(thisServer);
  action.request(req, res);
} */

/* mixin(ActionCalls!("uimGlossary", "CMSGlossary", "thisServer")); */

/* class DCMSGlossaryAction : DCMSAction {
  this() { super(); 
    this
    .rootPath("/cms/glossary") 
    .collectionName("glossary"); } 
}

class DCMSAction_CreateGlossary : DCMSGlossaryAction {
  this() { super(); } 

  override bool beforeResponse(STRINGAA options = null) {
    debug writeln(StyledString(moduleName!DCMSAction_CreateGlossary~":DCMSAction_CreateGlossary::beforeResponse").setForeground(AnsiColor.black).setBackground(AnsiColor.white));
    super.beforeResponse(options);
    if ("redirect" in options) return;    

    auto appSession = getAppSession(options);

    auto entity = CMSGlossaryItem;
    entity.fromRequest(options);  
    database[appSession.site.name, myCollectionName].insertOne(entity);

    options["redirect"] = myPath~"/view?id="~entity.id.toString; 
	}
}
auto CMSAction_CreateGlossary() { return new DCMSAction_CreateGlossary; }

void uimGlossaryCreateAction(HTTPServerRequest req, HTTPServerResponse res) {
  debugMethodCall(moduleName!uimGlossaryCreateAction~":uimGlossaryCreateAction");

  auto action = CMSAction_CreateGlossary;
  action.request(req, res);
}

class DCMSAction_UpdateGlossary : DCMSGlossaryAction {
  this() { super(); } 

  override bool beforeResponse(STRINGAA options = null) {
    debug writeln(StyledString(moduleName!DCMSAction_UpdateGlossary~":DCMSAction_UpdateGlossary::beforeResponse").setForeground(AnsiColor.black).setBackground(AnsiColor.white));
    super.beforeResponse(options);
    if ("redirect" in options) return;     

    auto appSession = getAppSession(options);

    auto entity = CMSGlossaryItem.fromRequest(options);  
    database[appSession.site.name, myCollectionName].updateOne(entity);

    options["redirect"] = myPath~"/view?id="~entity.id.toString;
	}
}
auto CMSAction_UpdateGlossary() { return new DCMSAction_UpdateGlossary; }

void uimGlossaryUpdateAction(HTTPServerRequest req, HTTPServerResponse res) {
  debugMethodCall(moduleName!uimGlossaryUpdateAction~":uimGlossaryUpdateAction");

  auto action = CMSAction_UpdateGlossary;
  action.request(req, res);
}

class DCMSAction_DeleteGlossary : DCMSGlossaryAction {
  this() { super(); } 

  override bool beforeResponse(STRINGAA options = null) {
    debug writeln(StyledString(moduleName!DCMSAction_DeleteGlossary~":DCMSAction_DeleteGlossary::beforeResponse").setForeground(AnsiColor.black).setBackground(AnsiColor.white));
    super.beforeResponse(options);
    if ("redirect" in options) return;    

    auto appSession = getAppSession(options);

    auto entity = CMSGlossaryItem.fromRequest(options);  
    database[appSession.site.name, myCollectionName].removeOne(entity);

    options["redirect"] = myPath;
	}
}
auto CMSAction_DeleteGlossary() { return new DCMSAction_DeleteGlossary; }

void uimGlossaryDeleteAction(HTTPServerRequest req, HTTPServerResponse res) {
  debugMethodCall(moduleName!uimGlossaryDeleteAction~":uimGlossaryDeleteAction");

  auto action = CMSAction_DeleteGlossary;
  action.request(req, res);
}
 */
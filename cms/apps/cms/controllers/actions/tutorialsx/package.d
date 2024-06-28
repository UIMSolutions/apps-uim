module apps.cms.controllers.actions.tutorialsx;

import apps.cms;
@safe:
/* import apps.cms.settings.tutorials;
import models.cms.entities.tutorial; */
/* 
void uimTutorialsCreateAction(HTTPServerRequest req, HTTPServerResponse res) {
  debugMethodCall(moduleName!uimTutorialsCreateAction~":uimTutorialsCreateAction");

  auto action = CMSAction_CreateTutorial(thisServer);
  action.request(req, res);
}

void uimTutorialsUpdateAction(HTTPServerRequest req, HTTPServerResponse res) {
  debugMethodCall(moduleName!uimTutorialsUpdateAction~":uimTutorialsUpdateAction");

  auto action = CMSAction_UpdateTutorial(thisServer);
  action.request(req, res);
}

void uimTutorialsDeleteAction(HTTPServerRequest req, HTTPServerResponse res) {
  debugMethodCall(moduleName!uimTutorialsDeleteAction~":uimTutorialsDeleteAction");

  auto action = CMSAction_DeleteTutorial(thisServer);
  action.request(req, res);
}
 */
/* mixin(ActionCalls!("uimTutorials", "CMSTutorial", "thisServer")); */
/* class DCMSTutorialAction : DCMSAction {
  this() { super(); 
    this
    .rootPath("/cms/tutorials") 
    .collectionName("tutorials"); } 
}

class DCMSAction_CreateTutorial : DCMSTutorialAction {
  this() { super(); } 

  override bool beforeResponse(STRINGAA options = null) {
    debug writeln(StyledString(moduleName!DCMSAction_CreateTutorial~":DCMSAction_CreateTutorial::beforeResponse").setForeground(AnsiColor.black).setBackground(AnsiColor.white));
    super.beforeResponse(options);
    if ("redirect" in options) return;    

    auto appSession = getAppSession(options);

    auto entity = CMSTutorial;
    entity.fromRequest(options);  
    database[appSession.site.name, myCollectionName].insertOne(entity);

    options["redirect"] = myPath~"/view?id="~entity.id.toString; 
	}
}
auto CMSAction_CreateTutorial() { return new DCMSAction_CreateTutorial; }

void uimTutorialsCreateAction(HTTPServerRequest req, HTTPServerResponse res) {
  debugMethodCall(moduleName!uimTutorialsCreateAction~":uimTutorialsCreateAction");

  auto action = CMSAction_CreateTutorial;
  action.request(req, res);
}

class DCMSAction_UpdateTutorial : DCMSTutorialAction {
  this() { super(); } 

  override bool beforeResponse(STRINGAA options = null) {
    debug writeln(StyledString(moduleName!DCMSAction_UpdateTutorial~":DCMSAction_UpdateTutorial::beforeResponse").setForeground(AnsiColor.black).setBackground(AnsiColor.white));
    super.beforeResponse(options);
    if ("redirect" in options) return;     

    auto appSession = getAppSession(options);

    auto entity = CMSTutorial.fromRequest(options);  
    database[appSession.site.name, myCollectionName].updateOne(entity);

    options["redirect"] = myPath~"/view?id="~entity.id.toString;
	}
}
auto CMSAction_UpdateTutorial() { return new DCMSAction_UpdateTutorial; }

void uimTutorialsUpdateAction(HTTPServerRequest req, HTTPServerResponse res) {
  debugMethodCall(moduleName!uimTutorialsUpdateAction~":uimTutorialsUpdateAction");

  auto action = CMSAction_UpdateTutorial;
  action.request(req, res);
}

class DCMSAction_DeleteTutorial : DCMSTutorialAction {
  this() { super(); } 

  override bool beforeResponse(STRINGAA options = null) {
    debug writeln(StyledString(moduleName!DCMSAction_DeleteTutorial~":DCMSAction_DeleteTutorial::beforeResponse").setForeground(AnsiColor.black).setBackground(AnsiColor.white));
    super.beforeResponse(options);
    if ("redirect" in options) return;    

    auto appSession = getAppSession(options);

    auto entity = CMSTutorial.fromRequest(options);  
    database[appSession.site.name, myCollectionName].removeOne(entity);

    options["redirect"] = myPath;
	}
}
auto CMSAction_DeleteTutorial() { return new DCMSAction_DeleteTutorial; }

void uimTutorialsDeleteAction(HTTPServerRequest req, HTTPServerResponse res) {
  debugMethodCall(moduleName!uimTutorialsDeleteAction~":uimTutorialsDeleteAction");

  auto action = CMSAction_DeleteTutorial;
  action.request(req, res);
}
 */
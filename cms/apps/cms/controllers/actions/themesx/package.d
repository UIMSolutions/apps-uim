module apps.cms.controllers.actions.themesx;

import apps.cms;
@safe:
/* import apps.cms.settings.themes;
import models.cms.entities.theme; */

/* void uimThemesCreateAction(HTTPServerRequest req, HTTPServerResponse res) {
  debugMethodCall(moduleName!uimThemesCreateAction~":uimThemesCreateAction");

  auto action = CMSAction_CreateTheme(thisServer);
  action.request(req, res);
}

void uimThemesUpdateAction(HTTPServerRequest req, HTTPServerResponse res) {
  debugMethodCall(moduleName!uimThemesUpdateAction~":uimThemesUpdateAction");

  auto action = CMSAction_UpdateTheme(thisServer);
  action.request(req, res);
}

void uimThemesDeleteAction(HTTPServerRequest req, HTTPServerResponse res) {
  debugMethodCall(moduleName!uimThemesDeleteAction~":uimThemesDeleteAction");

  auto action = CMSAction_DeleteTheme(thisServer);
  action.request(req, res);
} */
/* mixin(ActionCalls!("uimThemes", "CMSTheme", "thisServer")); */
/* class DCMSThemeAction : DCMSAction {
  this() { super(); 
    this
    .rootPath("/cms/themes") 
    .collectionName("themes"); } 
}

class DCMSAction_CreateTheme : DCMSThemeAction {
  this() { super(); } 

  override bool beforeResponse(STRINGAA options = null) {
    debug writeln(StyledString(moduleName!DCMSAction_CreateTheme~":DCMSAction_CreateTheme::beforeResponse").setForeground(AnsiColor.black).setBackground(AnsiColor.white));
    super.beforeResponse(options);
    if ("redirect" in options) return;    

    auto appSession = getAppSession(options);

    auto entity = CMSTheme;
    entity.fromRequest(options);  
    database[appSession.site.name, myCollectionName].insertOne(entity);

    options["redirect"] = myPath~"/view?id="~entity.id.toString; 
	}
}
auto CMSAction_CreateTheme() { return new DCMSAction_CreateTheme; }

void uimThemesCreateAction(HTTPServerRequest req, HTTPServerResponse res) {
  debugMethodCall(moduleName!uimThemesCreateAction~":uimThemesCreateAction");

  auto action = CMSAction_CreateTheme;
  action.request(req, res);
}

class DCMSAction_UpdateTheme : DCMSThemeAction {
  this() { super(); } 

  override bool beforeResponse(STRINGAA options = null) {
    debug writeln(StyledString(moduleName!DCMSAction_UpdateTheme~":DCMSAction_UpdateTheme::beforeResponse").setForeground(AnsiColor.black).setBackground(AnsiColor.white));
    super.beforeResponse(options);
    if ("redirect" in options) return;     

    auto appSession = getAppSession(options);

    auto entity = CMSTheme.fromRequest(options);  
    database[appSession.site.name, myCollectionName].updateOne(entity);

    options["redirect"] = myPath~"/view?id="~entity.id.toString;
	}
}
auto CMSAction_UpdateTheme() { return new DCMSAction_UpdateTheme; }

void uimThemesUpdateAction(HTTPServerRequest req, HTTPServerResponse res) {
  debugMethodCall(moduleName!uimThemesUpdateAction~":uimThemesUpdateAction");

  auto action = CMSAction_UpdateTheme;
  action.request(req, res);
}

class DCMSAction_DeleteTheme : DCMSThemeAction {
  this() { super(); } 

  override bool beforeResponse(STRINGAA options = null) {
    debug writeln(StyledString(moduleName!DCMSAction_DeleteTheme~":DCMSAction_DeleteTheme::beforeResponse").setForeground(AnsiColor.black).setBackground(AnsiColor.white));
    super.beforeResponse(options);
    if ("redirect" in options) return;    

    auto appSession = getAppSession(options);

    auto entity = CMSTheme.fromRequest(options);  
    database[appSession.site.name, myCollectionName].removeOne(entity);

    options["redirect"] = myPath;
	}
}
auto CMSAction_DeleteTheme() { return new DCMSAction_DeleteTheme; }

void uimThemesDeleteAction(HTTPServerRequest req, HTTPServerResponse res) {
  debugMethodCall(moduleName!uimThemesDeleteAction~":uimThemesDeleteAction");

  auto action = CMSAction_DeleteTheme;
  action.request(req, res);
}
 */
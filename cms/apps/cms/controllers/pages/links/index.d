module apps.cms.controllers.pages.links.index;

import apps.cms;
@safe:

class DCMSLinksIndexPageController : DCMSIndexPageController {
  mixin(ControllerThis!("CMSLinksIndexPageController"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);
  }
  
  override bool beforeResponse(STRINGAA options = null) {
    // debugMethodCall(moduleName!DCMSLinksIndexPageController~":DCMSLinksIndexPageController::beforeResponse");
    if (!super.beforeResponse(options) || hasError || "redirect" in options) { return false; }
    
    auto mySession = manager.session(options);
    if (mySession is null) {
      debug writeln("Session missing"); 
      return false; 
    }

    if (!mySession.site) { 
      this.error("Session missing"); 
      return false; 
    }

    auto myEntityBase = this.entityBase;
    if (myEntityBase) { debug writeln("Database found"); }
    else { 
      this.error("Database missing"); 
      return false; }

    if (auto entitiesView = cast(DCMSIndexView)this.view) {
      debug writeln("entitiesView found");

      auto dbEntities = myEntityBase.tenant("uim").collection("cms_links").findMany();
      debug writeln("Found entities: ", dbEntities.length);

      entitiesView
        .rootPath("/cms/links")
        .entities(dbEntities);
    }
    else { 
      this.error("entitiesView missing"); 
      return false; }

    return true;
  }
}
mixin(ControllerCalls!("CMSLinksIndexPageController"));
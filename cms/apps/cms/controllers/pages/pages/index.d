module apps.cms.controllers.pages.pages.index;

import apps.cms;
@safe:

class DCMSPagesIndexPageController : DCMSIndexPageController {
  mixin(ControllerThis!("CMSPagesIndexPageController"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);
  }
  
  override bool beforeResponse(STRINGAA options = null) {
    // debugMethodCall(moduleName!DCMSPagesIndexPageController~":DCMSPagesIndexPageController::beforeResponse");
    if (!super.beforeResponse(options) || hasError || "redirect" in options) { return false; }
    
    auto mySession = manager.session(options);
    if (mySession is null) { 
      debug writeln("AppSession missing"); 
      return false; 
    }

    if (!mySession.site) { 
      this.error("AppSession missing"); 
      return false; 
    }

    auto myEntityBase = this.entityBase;
    if (myEntityBase) { debug writeln("Database found"); }
    else { 
      this.error("Database missing"); 
      return false; }

    if (auto entitiesView = cast(DCMSIndexView)this.view) {
      debug writeln("entitiesView found");

      auto dbEntities = myEntityBase.tenant("uim").collection("cms_pages").findMany();
      debug writeln("Found entities: ", dbEntities.length);

      entitiesView
        .rootPath("/cms/pages")
        .entities(dbEntities);
    }
    else { 
      this.error("entitiesView missing"); 
      return false; }

    return true;
  }
}
mixin(ControllerCalls!("CMSPagesIndexPageController"));
module apps.cms.controllers.pages.docus.index;

import apps.cms;
@safe:

class DCMSDocusIndexPageController : DCMSPageController {
  mixin(ControllerThis!("CMSDocusIndexPageController"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    this
      .view(
        CMSDocusIndexView(this));
  }
  
  override bool beforeResponse(STRINGAA options = null) {
    // debugMethodCall(moduleName!DCMSDocusIndexPageController~":DCMSDocusIndexPageController::beforeResponse");
    if (!super.beforeResponse(options) || hasError || "redirect" in options) { return false; }
    
    auto mySession = manager.session(options);
    if (mySession is null) { 
      debug writeln("AppSession missing"); 
      return false; }

    if (!mySession.site) { 
      this.error("AppSession missing"); 
      return false; }

    auto myEntityBase = this.entityBase;
    if (myEntityBase) { debug writeln("Database found"); }
    else { 
      this.error("Database missing"); 
      return false; }

    if (auto entitiesView = cast(DEntitiesListView)this.view) {
      debug writeln("entitiesView found");

      auto dbEntities = myEntityBase.tenant("uim").collection("cms_docus").findMany();
      debug writeln("Found entities: ", dbEntities.length);

      entitiesView
        .rootPath("/cms/docus")
        .entities(dbEntities);
    }
    else { 
      this.error("entitiesView missing"); 
      return false; }

    return true;
  }
}
mixin(ControllerCalls!("CMSDocusIndexPageController"));
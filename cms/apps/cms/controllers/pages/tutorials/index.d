module apps.cms.controllers.pages.tutorials.index;

import apps.cms;
@safe:

class DCMSTutorialsIndexPageController : DCMSIndexPageController {
  mixin(ControllerThis!("CMSTutorialsIndexPageController"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);
  }
  
  override bool beforeResponse(STRINGAA options = null) {
    // debugMethodCall(moduleName!DCMSTutorialsIndexPageController~":DCMSTutorialsIndexPageController::beforeResponse");
    if (!super.beforeResponse(options) || hasError || "redirect" in options) { return false; }
    
    auto mySession = manager.session(options);
    if (mySession is null) {
      debug writeln("mySession missing"); 
      return false; }

    if (!mySession.site) { 
      this.error("mySession missing"); 
      return false; 
    }

    auto myEntityBase = this.entityBase;
    if (myEntityBase) { debug writeln("Database found"); }
    else { 
      this.error("Database missing"); 
      return false; }

    if (auto entitiesView = cast(DCMSIndexView)this.view) {
      debug writeln("entitiesView found");

      auto dbEntities = myEntityBase.tenant("uim").collection("cms_tutorials").findMany();
      debug writeln("Found entities: ", dbEntities.length);

      entitiesView
        .rootPath("/cms/tutorials")
        .entities(dbEntities);
    }
    else { 
      this.error("entitiesView missing"); 
      return false; }

    return true;
  }
}
mixin(ControllerCalls!("CMSTutorialsIndexPageController"));
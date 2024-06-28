module apps.cms.controllers.pages.glossary.index;

import apps.cms;
@safe:

class DCMSGlossaryIndexPageController : DCMSIndexPageController {
  mixin(ControllerThis!("CMSGlossaryIndexPageController"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    this
      .view(
        CMSGlossaryIndexView(this));
  }
  
  override bool beforeResponse(STRINGAA options = null) {
    // debugMethodCall(moduleName!DCMSGlossaryIndexPageController~":DCMSGlossaryIndexPageController::beforeResponse");
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

      auto dbEntities = myEntityBase.tenant("uim").collection("cms_glossary").findMany();
      debug writeln("Found entities: ", dbEntities.length);

      entitiesView
        .rootPath("/cms/glossary")
        .entities(dbEntities);
    }
    else { 
      this.error("entitiesView missing"); 
      return false; }

    return true;
  }
}
mixin(ControllerCalls!("CMSGlossaryIndexPageController"));
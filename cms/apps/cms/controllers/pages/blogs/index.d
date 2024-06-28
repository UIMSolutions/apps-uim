module apps.cms.controllers.pages.blogs.index;

import apps.cms;
@safe:

class DCMSBlogsIndexPageController : DPageController {
  mixin(ControllerThis!("CMSBlogsIndexPageController"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    this
      .view(CMSBlogsIndexView(this));
  }

  override bool beforeResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSBlogsIndexPageController~":DCMSBlogsIndexPageController::beforeResponse");
    if (!super.beforeResponse(options) || hasError || hasRedirect) { return false; }        

    // if (hasError || "redirect" in options) { return; }
    
    if (!manager) { return false; } // No manager no fun ;-)

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

    if (auto entitiesView = cast(DEntitiesListView)this.view) {
      debug writeln("entitiesView found");

      auto dbEntities = myEntityBase.tenant("uim").collection("cms_blogs").findMany();
      debug writeln("Found entities: ", dbEntities.length);

      entitiesView
        .rootPath("/cms/blogs")
        .entities(dbEntities);
    }
    else { 
      this.error("entitiesView missing"); 
      return false; }

    return true;
  } 
}
mixin(ControllerCalls!("CMSBlogsIndexPageController"));

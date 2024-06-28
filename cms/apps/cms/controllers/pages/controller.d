module apps.cms.controllers.pages.controller;

import apps.cms;
@safe:

class DCMSPageController : DPageController {
  mixin(ControllerThis!("CMSPageController"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    this
      .addChecks([
        SessionHasHTTPSessionCheck, SessionHasSiteCheck, // Check appSesssion
        DatabaseHasSessionsCheck, DatabaseHasSitesCheck // Check database
      ]);
  }

  mixin(OProperty!("string", "entityName"));

  override bool beforeResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSPageController~":DCMSPageController::beforeResponse");
    if (!super.beforeResponse(options) || hasError || "redirect" in options) { return false; }
    
    if (entityBase) {
      auto blogs = entityBase.tenant("uim").collection("cms_sites").findMany;
      auto docus = entityBase.tenant("uim").collection("cms_docus").findMany;
      auto glossary = entityBase.tenant("uim").collection("cms_glossary").findMany;
      auto news = entityBase.tenant("uim").collection("cms_news").findMany;
      auto links = entityBase.tenant("uim").collection("cms_links").findMany;
    }    

    return true;
  }

  override void afterResponse(STRINGAA options = null) {
    // debugMethodCall(moduleName!DCMSPageController~":DCMSPageController::afterResponse");
    super.afterResponse(options);
  }

}
mixin(ControllerCalls!("CMSPageController"));

version(test_uim_cms) { unittest {
    assert(new DCMSPageController);
    assert(CMSPageController);
  }
} 
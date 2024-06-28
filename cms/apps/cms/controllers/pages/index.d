module apps.cms.controllers.pages.index;

import apps.cms;
@safe:

class DCMSIndexPageController : DPageController {
  mixin(ControllerThis!("CMSIndexPageController"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    this
      .view(CMSIndexView(this));
      /* .checks([AppSessionHasSessionCheck]) */
  }

  override bool beforeResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSIndexPageController~":DCMSIndexPageController::beforeResponse");
    if (!super.beforeResponse(options) || hasError || "redirect" in options) { return false; }

    // AppSessionHasSiteCheckId(this).check(_request, _response, reqParameters);

    debug writeln("Manager ", (manager ? "exists" : "missing"));
    debug writeln("Looking for current Session");
    if (auto mySession = manager.session(options)) {
      debug writeln("Found current Session");
      auto mySite    = mySession.site;
        
      // debug writeln(moduleName!DCMSIndexPageController~":DCMSIndexPageController::beforeResponse - Looking for entities in ", site.name, ":", collectionName);
      auto entities = entityBase.tenant(site.name).collection(collectionName).findMany;

      auto poolId = uniform(1, 1_000_000_000);
      entitiesPool[poolId] = entities;
      options["poolId"] = to!string(poolId);
    }
    /* if (auto appSession = getAppSession(options)) {      
      debug writeln(appSession.debugInfo);
      auto session = appSession.session; 
      auto site    = appSession.site;

      if (site) { // selected site
        debug writeln("Has Site", site.id, "/", site.name);
        session["siteId"] = site.id.toString;
        this.view(
          IndexView(this).selectedSite(site));
      }
      else {
        debug writeln("No Site");

        auto dbSites = database ? database["systems", "system_sites").findMany : null;
        debug writeln("Found sites = ", dbSites.length);

        this.view(
          IndexView(this).sites(dbSites));
      }
    }
    else {
      debug writeln("No AppSession");
    } */

/*   this(string jsPath, string myPath, string myEntities, string myEntity, string myCollectionName) { 
    super(); 

    this
    .jsPath(jsPath).pgPath(myPath).entitiesName(myEntities).entityName(myEntity).collectionName(myCollectionName)
    .title("UIM!CMS > "~myEntities)
    .checks([AppSessionExistsCheck, AppSessionHasSessionCheck, AppSessionHasSiteCheck, APPCheckDatabaseExists])
    .header(
      PageHeader
      .rootPath(pgPath).preTitle(myEntities).title("Übersicht "~myEntities).actions(["refresh", "create"])
      .breadcrumbs(
        BS5BreadcrumbList(["breadcrumb-arrows"])
        .link(["href":"/"], "UIM!CMS")
        .item(["active"], ["aria-current":"page"], H5A(["href":"#"], myEntities)))
    )
    .collectionName(myCollectionName)
    .form(EntitiesListForm.rootPath(pgPath));

    this.scripts.addLinks(
      "/js/apps/"~jsPath~"/entity.js",
      "/js/apps/"~jsPath~"/list.js");

  } */
    return true;
  }
  
  override void jsCode(STRINGAA reqParameters) {
    super.jsCode(reqParameters);
    if (viewMode == ViewModes.JS) 
      addToPageScript(reqParameters, 
      `window.addEventListener("load", event => `~
        jsBlock("listEntities('"~"(session ? session.id.toString : \"\")"~"');")
      ~`)`);
  }
  unittest {
    version(test_uim_cms) {
      /// TODO
    }}
}
mixin(ControllerCalls!("CMSIndexPageController"));



/*********************************************************************************************************
  Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
  License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
  Authors: Ozan Nurettin Süel (Sicherheitsschmiede)                                                      
**********************************************************************************************************/
module apps.cms.controllers.pages.read;

import apps.cms;
@safe:

class DCMSReadPageController : DPageController {
  mixin(ControllerThis!("CMSReadPageController"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    this
      .view(CMSReadView(this));
  }


/*   this(string jsPath, string myPath, string myEntities, string myEntity, string myCollectionName) { super(); 
    this
    .jsPath(jsPath).pgPath(myPath).entitiesName(myEntities).entityName(myEntity).collectionName(myCollectionName)
    .title("UIM!CMS > "~myEntities~" > Anzeigen")
    .checks([mySessionExistsCheck, mySessionHasSessionCheck, mySessionHasSiteCheck])
    // .securityController(APPSecurityController(this))      
    .header(
      ViewPageHeader
      .rootPath(pgPath)// .mainTitle(myEntities)// .subTitle("Anzeigen "~myEntity)
      .breadcrumbs(BS5BreadcrumbList(["breadcrumb-arrows"])
        .link(["href":"/"], "UIM!CMS")
        .link(["href":pgPath], myEntities)
        .item(["active"], ["aria-current":"page"], H5A(["href":"#"], "Anzeigen")))
    );

    this
      .scripts
        .addLinks(        
          "/js/apps/"~jsPath~"/entity.js",
          "/js/apps/"~jsPath~"/view.js");

    this
      .scripts
        .addContents(editorSummary~editorText);

  }
 */  
  override void jsCode(STRINGAA reqParameters) {
    super.jsCode(reqParameters);
    if (viewMode == ViewModes.JS) 
      addToPageScript(reqParameters, 
    `
window.addEventListener('load', (event) => {
      setThemes('`~"(session ? session.id.toString : \"\")"~`', '');
      editorSummary.disabled(true);
      editorText.disabled(true);
      document.getElementById("form").addEventListener("submit", event => {
        event.preventDefault();
        viewEntity();
      })
    });`);
else addToPageScript(reqParameters, 
`window.addEventListener('load', (event) => {
  editorSummary.disabled(true);
  editorText.disabled(true);
  setThemes('`~"(session ? session.id.toString : \"\")"~`', '`~"entity.theme.toString"~`');
});`); 

  }

  override bool beforeResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSReadPageController~":DCMSReadPageController::beforeResponse");
    if (!super.beforeResponse(options) || hasError || "redirect" in options) { return false; }

    auto mySession = cast(DSession)manager.session(options);
    debug writeln("In DCMSCreateDCMSReadPageControllerAction: mySession "~mySession.id.toString);
    if (mySession is null) { return false; }

    if (auto myTenant = entityBase.tenant(mySession.site.name)) {
      debug writeln("In DCMSReadPageController: tenant "/* ~tenant.name */);

      if (auto myCollection = myTenant.collection(collectionName)) {
        debug writeln("In DCMSReadPageController: collection "~collectionName);

        auto entityId = options.get("entity_id", options.get("id", options.get("entityId", null)));
        if (entityId.isUUID) {  
          if (auto entity = myCollection.findOne(UUID(entityId))) {
            if (auto entityView = cast(DEntityCRUDView)this.view) {
              entityView
                .entity(entity)
                .crudMode(CRUDModes.Read)
                .rootPath(this.rootPath)
                .readonly(true);
            }
          }
        }
      }
    }

    return true;
  }
}
mixin(ControllerCalls!("CMSReadPageController"));
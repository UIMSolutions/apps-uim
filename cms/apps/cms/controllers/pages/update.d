/*********************************************************************************************************
  Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
  License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
  Authors: Ozan Nurettin Süel (Sicherheitsschmiede)                                                      
**********************************************************************************************************/
module apps.cms.controllers.pages.update;

import apps.cms;
@safe:

class DCMSUpdatePageController : DPageController {
  mixin(ControllerThis!("CMSUpdatePageController"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    this
      .view(CMSUpdateView(this));
  }
  /*   this(string jsPath, string myPath, string myEntities, string myEntity, string myCollectionName) { super(); 
    this
    .jsPath(jsPath).pgPath(myPath).entitiesName(myEntities).entityName(myEntity).collectionName(myCollectionName)
    .title("UIM!CMS > "~myEntities~" > Bearbeiten")
    .checks([mySessionExistsCheck, mySessionHasSessionCheck, mySessionHasSiteCheck])
    // .securityController(APPSecurityController(this))
    .header(
      APPEditPageHeader
      .rootPath(pgPath)// .mainTitle(myEntities)// .subTitle("Bearbeiten "~myEntity)
      .breadcrumbs(BS5BreadcrumbList(["breadcrumb-arrows"])
        .link(["href":"/"], "UIM!CMS")
        .link(["href":pgPath], myEntities)
        .item(["active"], ["aria-current":"page"], H5A(["href":"#"], "Bearbeiten")))
    );

    this.scripts.addLinks(
      "/js/apps/"~jsPath~"/entity.js",
      "/js/apps/"~jsPath~"/edit.js");

    this.scripts.addContents(editorSummary~editorText);
  } */
  unittest {
    version(test_uim_cms) {
      /// TODO
    }}

  override void jsCode(STRINGAA reqParameters) {
    super.jsCode(reqParameters);

    // TODO  setThemes('`~sessionId~`', '');

    if (viewMode == ViewModes.JS) 
      addToPageScript(reqParameters,     
      `window.addEventListener('load', (event) => {
        document.getElementById("form").addEventListener("submit", event => {
          event.preventDefault();
          editorSummary.save();
          editorText.save();
          editEntity();
        })
      });`);
      else 
        addToPageScript(reqParameters,     
      `window.addEventListener('load', (event) => {
        document.getElementById("form").addEventListener("submit", event => {
          editorSummary.save();
          editorText.save();
        })
      });`); 
 
  }
  unittest {
    version(test_uim_cms) {
      /// TODO
    }}

  override bool beforeResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSUpdatePageController~":DCMSUpdatePageController::beforeResponse");
    if (super.beforeResponse(options) || hasError || "redirect" in options) { return false; }

    auto mySession = manager.session(options);
    debug writeln("In DCMSCreateDCMSUpdatePageControllerAction: mySession "~mySession.httpSessionId);
    if (mySession is null) { return false; }

    if (auto tenant = entityBase.tenant(mySession.site.name)) {
      debug writeln("In DCMSUpdatePageController: tenant "/* ~tenant.name */);

      if (auto collection = tenant[collectionName]) {
        debug writeln("In DCMSUpdatePageController: collection "~collectionName);

        auto entityId = options.get("entity_id", options.get("id", options.get("entityId", null)));
        if (entityId.isUUID) {  
          if (auto entity = collection.findOne(UUID(entityId))) {
            if (auto entityView = cast(DEntityCRUDView)this.view) {
              entityView
                .entity(entity)
                .crudMode(CRUDModes.Update)
                .rootPath(this.rootPath)
                .readonly(false);
            }
          }
        }
      }
    }
    
    return true;
  }
}
mixin(ControllerCalls!("CMSUpdatePageController"));
/*********************************************************************************************************
  Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
  License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
  Authors: Ozan Nurettin Süel (Sicherheitsschmiede)                                                      
**********************************************************************************************************/
module apps.cms.controllers.pages.create;

import apps.cms;
@safe:

class DCMSCreatePageController : DPageController {
  mixin(ControllerThis!("CMSCreatePageController"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    this
      .view(CMSCreateView(this));
/*     this
    .jsPath(jsPath).pgPath(myPath).entitiesName(myEntities).entityName(myEntity).collectionName(myCollectionName)
    .title("UIM!CMS > "~myEntities~" > Erstellen")
    .checks([mySessionExistsCheck, mySessionHasSessionCheck, mySessionHasSiteCheck, APPCheckDatabaseExists])
    // .securityController(APPSecurityController(this))      
    .view(
      CMSCreateView
        .header(
          APPCreatePageHeader(pgPath, myEntities, myEntity).actions(["refresh", "list"])
          .breadcrumbs(BS5BreadcrumbList(["breadcrumb-arrows"])
            .link(["href":"/"], "UIM!CMS")
            .link(["href":pgPath], myEntities)
            .item(["active"], ["aria-current":"page"], H5A(["href":"#"], "Erstellen"))))
    )
    .scripts.addLinks(
      "/js/apps/"~jsPath~"/entity.js",
      "/js/apps/"~jsPath~"/create.js");

    this.scripts.addContents(editorSummary~editorText);
 */  }
  unittest {
    version(test_uim_cms) {
      /// TODO
    }}
override void jsCode(STRINGAA options = null) {
    super.jsCode(options);
    if (viewMode == ViewModes.JS) 
      addToPageScript(options, 
      `window.addEventListener('load', (event) => {
        setThemes('`~"session.id.toString"~`', '');
        document.getElementById("form").addEventListener("submit", event => {
          event.preventDefault();
          editorSummary.save();
          editorText.save();
          createEntity();
        })
      });`);
    else 
      addToPageScript(options, 
        `window.addEventListener('load', (event) => {
          setThemes('`~"(session ? session.id.toString : \"\")"~`', '');
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
    debugMethodCall(moduleName!DCMSCreatePageController~":DCMSCreatePageController::beforeResponse");
    if (!super.beforeResponse(options) || hasError || hasRedirect) { return false; }    

    auto mySession = cast(DSession)manager.session(options);
    debug writeln("In DCMSCreateDCMSCreatePageControllerAction: mySession "~mySession.id.toString);
    if (mySession is null) return false;

    if (auto tenant = entityBase.tenant(mySession.site.id.toString)) {
      debug writeln("In DCMSCreatePageController: tenant "/* ~tenant.name */);

      if (auto collection = tenant[collectionName]) {
        debug writeln("In DCMSCreatePageController: collection "~collectionName);

        if (auto entity = collection.createFromTemplate) {                            
          if (auto entityView = cast(DEntityCRUDView)this.view) {
            entityView
              .entity(entity)
              .crudMode(CRUDModes.Create)
              .rootPath(this.rootPath)
              .readonly(true);
          }          
        }
      }
    }

    return true;
  }
}
mixin(ControllerCalls!("CMSCreatePageController"));
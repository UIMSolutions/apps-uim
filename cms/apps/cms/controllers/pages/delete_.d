/*********************************************************************************************************
  Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
  License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
  Authors: Ozan Nurettin Süel (Sicherheitsschmiede)                                                      
**********************************************************************************************************/
module apps.cms.controllers.pages.delete_;

import apps.cms;
@safe:

class DCMSDeletePageController : DPageController {
  mixin(ControllerThis!("CMSDeletePageController"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    this
      .view(CMSDeleteView(this));
  }

  /*   this(string jsPath, string myPath, string myEntities, string myEntity, string myCollectionName) { super(); 
    this
    .jsPath(jsPath).pgPath(myPath).entitiesName(myEntities).entityName(myEntity).collectionName(myCollectionName)
    .title("UIM!CMS > "~myEntities~" > Löschen")
    .checks([mySessionExistsCheck, mySessionHasSessionCheck, mySessionHasSiteCheck])
    .header(
      APPDeletePageHeader
      .rootPath(pgPath)// .mainTitle(myEntities)// .subTitle("Löschen "~myEntity)
      .breadcrumbs(BS5BreadcrumbList(["breadcrumb-arrows"])
        .link(["href":"/"], "UIM!CMS")
        .link(["href":pgPath], myEntities)
        .item(["active"], ["aria-current":"page"], H5A(["href":"#"], "Löschen"))));

    this.scripts.addLinks(        
      "/js/apps/"~jsPath~"/entity.js",
      "/js/apps/"~jsPath~"/delete.js");

    this.scripts.addContents(editorSummary~editorText);
  }
 */  unittest {
    version(test_uim_cms) {
      /// TODO
    }}

   override bool beforeResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSDeletePageController~":DCMSDeletePageController::beforeResponse");
    if (!super.beforeResponse(options) || hasError || "redirect" in options) { return false; }

    auto mySession = cast(DSession)manager.session(options);
    debug writeln("In DCMSDeletePageController: mySession "~mySession.id.toString);
    if (mySession is null) return false;
    
    auto myTenant = entityBase.tenant(mySession.site.name);
    debug writeln("In DCMSDeletePageController: tenant "/* ~tenant.name */);
    if (myTenant is null) return false;

    if (auto collection = myTenant.collection(collectionName)) {
      debug writeln("In DCMSDeletePageController: collection "~collectionName);

      auto entityId = options.get("entity_id", options.get("id", options.get("entityId", null)));
      if (entityId.isUUID) {  
        if (auto entity = collection.findOne(UUID(entityId))) {
          if (auto entityView = cast(DEntityCRUDView)this.view) {
            entityView
              .entity(entity)
              .crudMode(CRUDModes.Delete)
              .rootPath(this.rootPath)
              .readonly(true);
          }
        }
      }
    }

    return true;
  }
}
mixin(ControllerCalls!("CMSDeletePageController"));
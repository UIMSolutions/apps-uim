module apps.cms.controllers.actions.delete_;

import apps.cms;
@safe:

class DCMSDeleteActionController : DActionController {
  mixin(ControllerThis!("CMSDeleteActionController"));

  override bool beforeResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSDeleteActionController~":DCMSDeleteActionController::beforeResponse");
    if (!super.beforeResponse(options) || hasError || "redirect" in options) { return false; }    

    auto mySession = cast(DSession)manager.session(options);
    debug writeln("In DCMSDeleteActionController: mySession "~mySession.id.toString);
    if (mySession is null) return false;

    if (auto myTenant = entityBase.tenant(mySession.site.id.toString)) {
      debug writeln("In DCMSDeleteActionController: tenant "/* ~tenant.name */);

      if (auto myCollection = myTenant.collection(collectionName)) {
        debug writeln("In DCMSDeleteActionController: collection "~collectionName);

        if (auto entity = myCollection.createFromTemplate) {
          entity.readFromRequest(options);   
          debug writeln("In DCMSDeleteActionController: entity "~entity.name);

          myCollection.removeOne(entity);
        }

        options["redirect"] = rootPath;
      }  
    }

    return true;
	} 
}
mixin(ControllerCalls!("CMSDeleteActionController", "DCMSDeleteActionController"));

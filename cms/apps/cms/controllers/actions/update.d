module apps.cms.controllers.actions.update;

import apps.cms;
@safe:

class DCMSUpdateActionController : DActionController {
  mixin(ControllerThis!("CMSUpdateActionController"));

  override bool beforeResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSUpdateActionController~":DCMSUpdateActionController::beforeResponse");
    if (!super.beforeResponse(options) || hasError || "redirect" in options) { return false; }     

    auto mySession = manager.session(options);
    debug writeln("In DCMSUpdateActionController: mySession "~mySession.httpSessionId);
    if (mySession is null) return false;

    if (auto myTenant = entityBase.tenant(mySession.site.name)) {
      debug writeln("In DCMSUpdateActionController: tenant "/* ~tenant.name */);

      if (auto myCollection = myTenant.collection(collectionName)) {
        debug writeln("In DCMSUpdateActionController: collection "~collectionName);

        if (auto entityId = options.get("entity_id", null)) {
          debug writeln("found entityId "~entityId);
       
          if (auto entity = myCollection.findOne(UUID(entityId))) {        
            entity.readFromRequest(options);
            myCollection.updateOne(entity);
            options["redirect"] = rootPath~"/view?id="~entityId;
          }
        }
      }
    }

    return true;
	}  
}
mixin(ControllerCalls!("CMSUpdateActionController", "DCMSUpdateActionController"));

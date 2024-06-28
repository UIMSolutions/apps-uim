module apps.cms.controllers.actions.create;

import apps.cms;
@safe:

class DCMSCreateActionController : DActionController {
  mixin(ControllerThis!("CMSCreateActionController"));
  
  override bool beforeResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSCreateActionController~":DCMSCreateActionController::beforeResponse");    
    if (!super.beforeResponse(options) || hasError || "redirect" in options) { return false; }    

    auto mySession = manager.session(options);
    debug writeln("In DCMSCreateActionController: mySession "~mySession.httpSessionId);
    if (mySession is null) return false;

    if (auto myTenant = entityBase.tenant(mySession.site.name)) {
      debug writeln("In DCMSCreateActionController: tenant "/* ~tenant.name */);

      if (auto myCollection = myTenant.collection(collectionName)) {
        debug writeln("In DCMSCreateActionController: collection "~collectionName);

        if (auto entity = myCollection.createFromTemplate) {
          debug writeln("In DCMSCreateActionController: entity "~entity.name);
          entity.readFromRequest(options);   

          myCollection.insertOne(entity);
          debug writeln("entity.id = ", entity.id);
          options["redirect"] = this.rootPath ~ "/view?id="~entity.id.toString; 
        }  
      }
    }

    return true;
  }
}
mixin(ControllerCalls!("CMSCreateActionController", "DCMSCreateActionController"));

module apps.bim.controllers.actions.delete_;

import apps.bim;
@safe:

class DBIMDeleteActionController : DDeleteActionController {
  mixin(ControllerThis!("BIMDeleteActionController"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);
    
    this
    .checks([
      SessionHasHTTPSessionCheck, SessionHasSiteCheck, // AppSession related checks
      DatabaseHasAccountsCheck]); // Database related checks  
  }
}
mixin(ControllerCalls!("BIMDeleteActionController"));
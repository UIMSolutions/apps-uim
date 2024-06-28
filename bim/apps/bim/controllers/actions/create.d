module apps.bim.controllers.actions.create;

import apps.bim;
@safe:

class DBIMCreateActionController : DCreateActionController {
  mixin(ControllerThis!("BIMCreateActionController"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    this
    .checks([
      SessionHasHTTPSessionCheck, SessionHasSiteCheck, // AppSession related checks
      DatabaseHasAccountsCheck]); // Database related checks  
  }
}
mixin(ControllerCalls!("BIMCreateActionController"));
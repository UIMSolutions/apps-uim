module apps.bim.controllers.actions.update;

import apps.bim;
@safe:

class DBIMUpdateActionController : DUpdateActionController {
  mixin(ControllerThis!("BIMUpdateActionController"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);
    
    this
    .checks([
      SessionHasHTTPSessionCheck, SessionHasSiteCheck, // AppSession related checks
      DatabaseHasAccountsCheck]); // Database related checks  
  }
}
mixin(ControllerCalls!("BIMUpdateActionController"));
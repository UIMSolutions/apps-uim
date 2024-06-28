module apps.cms.controllers.actions.action;

import apps.cms;
@safe:

class DCMSActionController : DActionController {
  mixin(ControllerThis!("CMSActionController"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    this
    .checks([
      SessionHasHTTPSessionCheck, SessionHasSiteCheck, // AppSession related checks
      DatabaseHasAccountsCheck]); // Database related checks
  }
}
mixin(ControllerCalls!("CMSActionController"));


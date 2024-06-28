module apps.bim.controllers.pages.error;

import apps.bim;
@safe:

class DBIMErrorPageController : DPageController {
  mixin(ControllerThis!("BIMErrorPageController"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    this
      .view(BIMErrorView(this));
  }
}
mixin(ControllerCalls!("BIMErrorPageController"));

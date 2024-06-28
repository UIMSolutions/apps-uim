module apps.ecm.controllers.pages.index;

import apps.ecm;
@safe:

class DIndexPageController : DPageController {
  mixin(ControllerThis!("IndexPageController"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    this
      .view(ECMIndexView(this));
  }
}
mixin(ControllerCalls!("IndexPageController"));

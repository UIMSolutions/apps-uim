module apps.cms.controllers.pages.themes.edit;

import apps.cms;
@safe:

class DCMSThemesEditPageController : DPageController {
  mixin(ControllerThis!("CMSThemesEditPageController"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    this
      .view(CMSThemesUpdateView(this));
  }
}
mixin(ControllerCalls!("CMSThemesEditPageController"));

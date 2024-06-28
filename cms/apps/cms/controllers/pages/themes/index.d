module apps.cms.controllers.pages.themes.index;

import apps.cms;
@safe:

class DCMSThemesIndexPageController : DPageController {
  mixin(ControllerThis!("CMSThemesIndexPageController"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    this
      .view(CMSThemesIndexView(this));
  }
}
mixin(ControllerCalls!("CMSThemesIndexPageController", "DCMSThemesIndexPageController"));

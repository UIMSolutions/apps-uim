module apps.cms.controllers.pages.themes.read;

import apps.cms;
@safe:

class DCMSThemesReadPageController : DPageController {
  mixin(ControllerThis!("CMSThemesReadPageController"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    this
      .view(CMSThemesReadView(this));
  }
}
mixin(ControllerCalls!("CMSThemesReadPageController"));

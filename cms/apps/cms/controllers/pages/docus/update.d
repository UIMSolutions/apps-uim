module apps.cms.controllers.pages.docus.update;

import apps.cms;
@safe:

class DCMSDocusUpdatePageController : DCMSUpdatePageController {
  mixin(ControllerThis!("CMSDocusUpdatePageController"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    this
      .view(
        CMSDocusUpdateView(this))
      .scripts
        .addContents(
          editorSummary~editorText,
    `window.addEventListener('load', (event) => {
      document.getElementById("form").addEventListener("submit", event => {
        editorSummary.save();
        editorText.save();
      })
    });`);

    this
      .rootPath("/cms/docus") 
      .collectionName("cms_docus"); 
  }
}
mixin(ControllerCalls!("CMSDocusUpdatePageController"));
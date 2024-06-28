module apps.cms.controllers.pages.docus.read;

import apps.cms;
@safe:

class DCMSDocusReadPageController : DCMSReadPageController {
  mixin(ControllerThis!("CMSDocusReadPageController"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    this
      .view(
        CMSDocusReadView(this))
      .scripts
        .addContents(
          editorSummary~editorText~
          "editorSummary.disabled();"~
          "editorText.disabled();"
        );

    this
      .rootPath("/cms/docus") 
      .collectionName("cms_docus"); 
  }
}
mixin(ControllerCalls!("CMSDocusReadPageController"));
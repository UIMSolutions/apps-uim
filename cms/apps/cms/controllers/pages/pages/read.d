module apps.cms.controllers.pages.pages.read;

import apps.cms;
@safe:

class DCMSPagesReadPageController : DCMSReadPageController {
  mixin(ControllerThis!("CMSPagesReadPageController"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    this.scripts.addContents(
      editorSummary~
      editorText~
      "editorSummary.disabled();"~
      "editorText.disabled();"
    );

    this
      .rootPath("/cms/pages") 
      .collectionName("cms_pages"); 
  }
}
mixin(ControllerCalls!("CMSPagesReadPageController"));
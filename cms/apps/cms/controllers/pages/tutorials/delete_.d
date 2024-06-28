module apps.cms.controllers.pages.tutorials.delete_;

import apps.cms;
@safe:

class DCMSTutorialsDeletePageController : DCMSDeletePageController {
  mixin(ControllerThis!("CMSTutorialsDeletePageController"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    this.scripts.addContents(
      editorSummary~
      editorText~
      "editorSummary.disabled();"~
      "editorText.disabled();"
    );

    this
      .rootPath("/cms/tutorials") 
      .collectionName("cms_tutorials"); 
  }
}
mixin(ControllerCalls!("CMSTutorialsDeletePageController"));
module apps.cms.controllers.pages.glossary.read;

import apps.cms;
@safe:

class DCMSGlossaryReadPageController : DCMSReadPageController {
  mixin(ControllerThis!("CMSGlossaryReadPageController"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    this
      .view(
        CMSGlossaryReadView(this))
      .scripts
        .addContents(
          editorSummary~editorText~
          "editorSummary.disabled();"~
          "editorText.disabled();"
        );

    this
      .rootPath("/cms/glossary") 
      .collectionName("cms_glossary"); 
  }
}
mixin(ControllerCalls!("CMSGlossaryReadPageController"));
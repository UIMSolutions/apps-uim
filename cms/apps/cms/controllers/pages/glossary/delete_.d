module apps.cms.controllers.pages.glossary.delete_;

import apps.cms;
@safe:

class DCMSGlossaryDeletePageController : DCMSDeletePageController {
  mixin(ControllerThis!("CMSGlossaryDeletePageController"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    this
      .view(
        CMSGlossaryDeleteView(this))
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
mixin(ControllerCalls!("CMSGlossaryDeletePageController"));
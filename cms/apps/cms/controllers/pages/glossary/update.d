module apps.cms.controllers.pages.glossary.update;

import apps.cms;
@safe:

class DCMSGlossaryUpdatePageController : DCMSUpdatePageController {
  mixin(ControllerThis!("CMSGlossaryUpdatePageController"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    this
      .view(
        CMSGlossaryUpdateView(this))
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
      .rootPath("/cms/glossary") 
      .collectionName("cms_glossary"); 
  }
}
mixin(ControllerCalls!("CMSGlossaryUpdatePageController"));
module apps.cms.controllers.pages.glossary.create;

import apps.cms;
@safe:

class DCMSGlossaryCreatePageController : DCMSCreatePageController {
  mixin(ControllerThis!("CMSGlossaryCreatePageController"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    this
      .view(
        CMSGlossaryCreateView(this))
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
mixin(ControllerCalls!("CMSGlossaryCreatePageController"));

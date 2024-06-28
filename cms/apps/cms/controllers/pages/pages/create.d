module apps.cms.controllers.pages.pages.create;

import apps.cms;
@safe:

class DCMSPagesCreatePageController : DCMSCreatePageController {
  mixin(ControllerThis!("CMSPagesCreatePageController"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    this
    .scripts.addContents(
      editorSummary~
      editorText,
`window.addEventListener('load', (event) => {
  document.getElementById("form").addEventListener("submit", event => {
    editorSummary.save();
    editorText.save();
  })
});`);

    this
      .rootPath("/cms/pages") 
      .collectionName("cms_pages"); 
  }
}
mixin(ControllerCalls!("CMSPagesCreatePageController"));

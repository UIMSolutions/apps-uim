module apps.cms.controllers.pages.links.update;

import apps.cms;
@safe:

class DCMSLinksUpdatePageController : DCMSUpdatePageController {
  mixin(ControllerThis!("CMSLinksUpdatePageController"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    this.scripts.addContents(
      editorSummary~editorText,
`window.addEventListener('load', (event) => {
  document.getElementById("form").addEventListener("submit", event => {
    editorSummary.save();
    editorText.save();
  })
});`);

    this
      .rootPath("/cms/links") 
      .collectionName("cms_links"); 
  }
}
mixin(ControllerCalls!("CMSLinksUpdatePageController"));
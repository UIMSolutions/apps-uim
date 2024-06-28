module apps.cms.controllers.pages.links.read;

import apps.cms;
@safe:

class DCMSLinksReadPageController : DCMSReadPageController {
  mixin(ControllerThis!("CMSLinksReadPageController"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    this.scripts.addContents(
      editorSummary~
      editorText~
      "editorSummary.disabled();"~
      "editorText.disabled();"
    );

    this
      .rootPath("/cms/links") 
      .collectionName("cms_links");     
  }
}
mixin(ControllerCalls!("CMSLinksReadPageController"));
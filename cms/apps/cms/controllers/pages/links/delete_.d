module apps.cms.controllers.pages.links.delete_;

import apps.cms;
@safe:

class DCMSLinksDeletePageController : DCMSDeletePageController {
  mixin(ControllerThis!("CMSLinksDeletePageController"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    this
      .view(
        CMSBlogsDeleteView(this))    
      .scripts
        .addContents(
          editorSummary~editorText~
          "editorSummary.disabled();"~
          "editorText.disabled();"
        );

    this
      .rootPath("/cms/links") 
      .collectionName("cms_links"); 
  }
}
mixin(ControllerCalls!("CMSLinksDeletePageController"));
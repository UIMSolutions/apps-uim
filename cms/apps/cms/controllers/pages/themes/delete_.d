module apps.cms.controllers.pages.themes.delete_;

import apps.cms;
@safe:

class DCMSThemesDeletePageController : DPageController {
  mixin(ControllerThis!("CMSThemesDeletePageController"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    this
      .view(CMSThemesDeleteView(this));

        this.scripts.addContents(
      editorSummary~
      editorText~
      "editorSummary.disabled();"~
      "editorText.disabled();"
    );

    this
      .rootPath("/cms/themes") 
      .collectionName("cms_themes"); 
  }
}
mixin(ControllerCalls!("CMSThemesDeletePageController"));

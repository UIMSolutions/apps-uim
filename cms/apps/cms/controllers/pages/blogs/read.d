module apps.cms.controllers.pages.blogs.read;

import apps.cms;
@safe:

class DCMSBlogsReadPageController : DPageController {
  mixin(ControllerThis!("CMSBlogsReadPageController"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    this
      .view(CMSBlogsReadView(this));

    this
      .view(
        CMSBlogsReadView(this))
      .rootPath("/cms/blogs") 
      .collectionName("cms_blogs")    
      .scripts
        .addContents(
          editorSummary~
          editorText~
          "editorSummary.disabled();"~
          "editorText.disabled();");


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
mixin(ControllerCalls!("CMSBlogsReadPageController", "DCMSBlogsReadPageController"));

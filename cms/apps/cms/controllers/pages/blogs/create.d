module apps.cms.controllers.pages.blogs.create;

import apps.cms;
@safe:

class DCMSBlogsCreatePageController : DPageController {
  mixin(ControllerThis!("CMSBlogsCreatePageController"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    this
      .view(CMSBlogsCreateView(this))
      .rootPath("/cms/blogs") 
      .collectionName("cms_blogs");     

    if (auto myView = cast(DCMSBlogsUpdateView)this.view) {
      /* if (auto myForm = cast(DForm)myView.form) {
        this
          .scripts
            .addContents(
              editorSummary~
              editorText,
        `window.addEventListener('load', (event) => {
          document.getElementById("`~myForm.id~`").addEventListener("submit", event => {
            editorSummary.save();
            editorText.save();
          })
        });`);
      } */
    }
  }
}
mixin(ControllerCalls!("CMSBlogsCreatePageController"));

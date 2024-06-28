module apps.cms.views.blogs.edit;

import apps.cms;
@safe:

class DCMSBlogsUpdateView : DCMSUpdateView {
  mixin(ViewThis!("CMSBlogsUpdateView"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    this
      .pageHeader(
        MVCEditPageHeader.rootPath(rootPath))
      .pageBody(PageBodyViewComponent)
      .pageFooter(MVCPageFooterViewComponent); 

     this
      .rootPath("/cms/blogs");

    if (auto myHeader = cast(DPageHeaderViewComponent)this.header) {
      myHeader
        .title(titleEdit("Blog bearbeiten"))
        .rootPath(this.rootPath);
    }

    if (auto myForm = cast(DForm)this.form) {
      myForm
        .action(this.rootPath~"/actions/update")
        .crudMode(CRUDModes.Update)/* 
        .content(FormContent.form(myForm)) */;

      if (auto myFormHeader = cast(DFormHeader)myForm.header) {
        myFormHeader
          .mainTitle("Blogs")
          .subTitle("Blogs bearbeiten");
      }
    }
  }

  override void beforeH5(STRINGAA options = null) {
    super.beforeH5(options);

    this
      .pageHeader
        .title("Blogs -> Edit")
        .breadcrumbs
          .items(
            ["/", "UIM"],
            ["/cms", "CMS"],
            [this.rootPath~"/blogs", "Blogs"],
            [this.rootPath~"/blogs/edit", "Edit"]
          );

        if (this.header) this.header.entity(this.entity);

    auto headerTitle = "Blog ID:"~(this.entity ? this.entity.id.toString : " - Unbekannt -");
    auto bodyTitle = "Blog Name:";

    if (auto myHeader = cast(DPageHeaderViewComponent)this.header) {
      myHeader
        .breadcrumbs
          .items(
            ["/", "UIM"],
            ["/cms", "CMS"],
            [this.rootPath, "Blogs"],
            [rootPath~"/update?id="~(this.entity ? this.entity["id"] : " -missing-"), "Bearbeiten"]
          );
    }
  }
}
mixin(ViewCalls!("CMSBlogsUpdateView", "DCMSBlogsUpdateView"));
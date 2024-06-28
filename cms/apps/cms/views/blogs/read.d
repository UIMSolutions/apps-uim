module apps.cms.views.blogs.read;

import apps.cms;
@safe:

class DCMSBlogsReadView : DCMSReadView {
  mixin(ViewThis!("CMSBlogsReadView"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    this
      .pageHeader(
        MVCReadPageHeader.rootPath(rootPath))
      .pageBody(PageBodyViewComponent)
      .pageFooter(MVCPageFooterViewComponent); 

    this
      .pageHeader
        .title("Blogs -> Read")
        .breadcrumbs
          .items(
            ["/", "UIM"],
            ["/cms", "CMS"],
            [this.rootPath~"/blogs", "Blogs"],
            [this.rootPath~"/blogs/read", "Read"]
          );

        this.rootPath("/cms/blogs");

    if (auto myHeader = cast(DPageHeaderViewComponent)this.header) {
      myHeader
        .title(titleView("Blog anzeigen")) 
        .actions([["refresh", "list", "create"]])
        .rootPath(this.rootPath)
        .breadcrumbs
          .items(
            ["/", "UIM"],
            ["/cms", "CMS"],
            [this.rootPath, "Blogs"],
            ["", "Anzeigen"]
          );
    }

    if (auto myForm = cast(DForm)this.form) {
      myForm
        .crudMode(CRUDModes.Read)
        .content(FormContent.form(myForm));

      if (auto myFormHeader = cast(DFormHeader)myForm.header) {
        myFormHeader
          .mainTitle("Blogs")
          .subTitle("Blogs anzeigen");
      }
    }
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSBlogsReadView~"::DCMSBlogsReadView:beforeH5");
    super.beforeH5(options);

    if (hasError || "redirect" in options) { return; }

    auto headerTitle = "Blog ID:"~(this.entity ? this.entity.id.toString : " - Unbekannt -");
    auto bodyTitle = "Blog Name:";

    this.form
      .parameter("headerTitle", headerTitle)
      .parameter("bodyTitle", bodyTitle)
      .entity(this.entity);
  }
}
mixin(ViewCalls!("CMSBlogsReadView", "DCMSBlogsReadView"));
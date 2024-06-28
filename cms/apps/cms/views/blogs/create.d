module apps.cms.views.blogs.create;

import apps.cms;
@safe:

class DCMSBlogsCreateView : DCMSCreateView {
  mixin(ViewThis!("CMSBlogsCreateView"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    this
      .pageHeader(MVCCreatePageHeader.rootPath(rootPath))
      .pageBody(PageBodyViewComponent)
      .pageFooter(MVCPageFooterViewComponent);  

    this.rootPath("/cms/blogs");
    if(auto myHeader = cast(DPageHeaderViewComponent)this.header) {
      myHeader
        //.title(titleCreate("Blog erstellen"))
        .rootPath(this.rootPath)
        .breadcrumbs
          .items(
          ["/", "UIM"],
          ["/cms", "CMS"],
          [this.rootPath, "Blogs"],
          ["", "Erstellen"]
        );
    }
    
    if (auto myForm = cast(DForm)this.form) {
      myForm
        .action(this.rootPath~"/actions/create")
        .header(FormHeader.form(myForm));

      if (auto myFormHeader = cast(DFormHeader)myForm.header) {
        myFormHeader
          .mainTitle("Neuer Blog")
          .subTitle("Bitte Werte eingeben")
          .actions([["cancel","save"]]);
      }
    }
  }

  override void beforeH5(STRINGAA options = null) {
    super.beforeH5(options);

    this
      .pageHeader
        .title("Blogs -> Create")
        .breadcrumbs
          .items(
            ["/", "UIM"],
            [this.rootPath, "CMS"],
            [this.rootPath~"/blogs", "Blogs"],
            [this.rootPath~"/blogs/create", "Create"]
          );

    options["rootPath"] = this.rootPath;

    if (this.manager && this.manager.entityBase) {
      this.entity(this.manager.entityBase.tenant("uim")["cms_blogs"].createFromTemplate);
    }

    if (auto myForm = cast(DForm)this.form) {
      myForm
        .action(this.rootPath~"/actions/create")
        .entity(this.entity);
    }
  }
}
mixin(ViewCalls!("CMSBlogsCreateView", "DCMSBlogsCreateView"));

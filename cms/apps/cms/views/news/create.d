module apps.cms.views.news.create;

import apps.cms;
@safe:

class DCMSNewsCreateView : DCMSView {
  mixin(ViewThis!("CMSNewsCreateView"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);
    
    this.rootPath("/cms/news");

    if(auto myHeader = cast(DPageHeaderViewComponent)this.header) {
      myHeader
        .title(titleCreate("News erstellen"))
        .rootPath(this.rootPath)
        .breadcrumbs
          .items(
          ["/", "UIM"],
          ["/cms", "CMS"],
          [this.rootPath, "News"],
          [this.rootPath~"/create", "Create"]
        );
    }
    
    if (auto myForm = cast(DForm)this.form) {
      myForm
        .action(this.rootPath~"/actions/create")
        .content(FormContent.form(myForm));

      if (auto myFormHeader = cast(DFormHeader)myForm.header) {
        myFormHeader
          .mainTitle("Neuer News")
          .subTitle("Bitte Werte eingeben")
          .actions([["cancel","save"]]);
      }
    }
  }
  
  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSNewsCreateView~"::DCMSNewsCreateView:beforeH5");
    super.beforeH5(options);

    this
      .pageHeader
        .title("News -> Create")
        .breadcrumbs
          .items(
            ["/", "UIM"],
            [this.rootPath, "CMS"],
            [this.rootPath~"/news", "News"],
            [this.rootPath~"/news/create", "Create"]
          );

        options["rootPath"] = this.rootPath;

    if (this.manager && this.manager.entityBase) {
      this.entity(this.manager.entityBase.tenant("uim")["cms_news"].createFromTemplate);
    }

    if (auto myForm = cast(DForm)this.form) {
      myForm
        .action(this.rootPath~"/actions/create")
        .entity(this.entity);
    }
  }
}
mixin(ViewCalls!("CMSNewsCreateView"));

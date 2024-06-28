module apps.cms.views.docus.create;

import apps.cms;
@safe:
import apps.cms.views.docus;

class DCMSDocusCreateView : DEntityCreateView {
  mixin(ViewThis!("CMSDocusCreateView"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);
    
    this.rootPath("/cms/docus");

    auto bc = BS5Breadcrumb(
      BS5BreadcrumbList
      
    );

    if(auto myHeader = cast(DPageHeaderViewComponent)this.header) {
      myHeader
        .title(titleCreate("Docu erstellen"))
        .rootPath(this.rootPath)
        .breadcrumbs
          .items(
            ["/cms", "CMS"],
            [this.rootPath, "Docus"],
            [this.rootPath~"/create", "Create"]
          );
    }
    
    if (auto myForm = cast(DForm)this.form) {
      myForm
        .action(this.rootPath~"/actions/create")
        .content(FormContent.form(myForm));

      if (auto myFormHeader = cast(DFormHeader)myForm.header) {
        myFormHeader
          .mainTitle("Neuer Docu")
          .subTitle("Bitte Werte eingeben")
          .actions([["cancel","save"]]);
      }
    }
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSDocusCreateView~"::DCMSDocusCreateView:beforeH5");
    super.beforeH5(options);

    options["rootPath"] = this.rootPath;

    if (this.manager && this.manager.entityBase) {
      this.entity(this.manager.entityBase.tenant("uim")["cms_docus"].createFromTemplate);
    }

    if (auto myForm = cast(DForm)this.form) {
      myForm
        .action(this.rootPath~"/actions/create")
        .entity(this.entity);
    }
  }
}
mixin(ViewCalls!("CMSDocusCreateView"));

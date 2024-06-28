module apps.cms.views.tutorials.create;

import apps.cms;
@safe:
import apps.cms.views.tutorials;

class DCMSTutorialsCreateView : DCMSCreateView {
  mixin(ViewThis!("CMSTutorialsCreateView"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);
    
    this.rootPath("/cms/tutorials");

    if(auto myHeader = cast(DPageHeaderViewComponent)this.header) {
      myHeader
        .title(titleCreate("Tutorial erstellen"))
        .rootPath(this.rootPath)
        .breadcrumbs
          .items(
            ["/cms", "CMS"],
            [this.rootPath, "Tutorials"],
            [this.rootPath~"/create", "Create"]
          );
    }
    
    if (auto myForm = cast(DForm)this.form) {
      myForm
        .action(this.rootPath~"/actions/create")
        .content(FormContent.form(myForm));

      if (auto myFormHeader = cast(DFormHeader)myForm.header) {
        myFormHeader
          .mainTitle("Neuer Tutorial")
          .subTitle("Bitte Werte eingeben")
          .actions([["cancel","save"]]);
      }
    }
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSTutorialsCreateView~"::DCMSTutorialsCreateView:beforeH5");
    super.beforeH5(options);

    options["rootPath"] = this.rootPath;

    if (this.manager && this.manager.entityBase) {
      this.entity(this.manager.entityBase.tenant("uim")["cms_tutorials"].createFromTemplate);
    }

    if (auto myForm = cast(DForm)this.form) {
      myForm
        .action(this.rootPath~"/actions/create")
        .entity(this.entity);
    }
  }
}
mixin(ViewCalls!("CMSTutorialsCreateView"));

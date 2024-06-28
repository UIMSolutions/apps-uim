module apps.cms.views.docus.read;

import apps.cms;
@safe:
import apps.cms.views.docus;

class DCMSDocusReadView : DEntityReadView {
  mixin(ViewThis!("CMSDocusReadView"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    this.rootPath("/cms/docus");

    if (auto myHeader = cast(DPageHeaderViewComponent)this.header) {
      myHeader
        .title(titleView("Docu anzeigen")) 
        .actions([["refresh", "list", "create"]])
        .rootPath(this.rootPath)
        .breadcrumbs
          .items(
            ["/", "UIM"],
            ["/cms", "CMS"],
            [this.rootPath, "Docus"],
            [" ", "Anzeigen"]
          );
    }

    if (auto myForm = cast(DForm)this.form) {
      myForm
        .crudMode(this.crudMode) 
        .content(FormContent.form(myForm));

      if (auto myFormHeader = cast(DFormHeader)myForm.header) {
        myFormHeader
          .mainTitle("Docus")
          .subTitle("Docus anzeigen");
      }
    }
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSDocusReadView~"::DCMSDocusReadView:beforeH5");
    super.beforeH5(options);
    if (hasError || "redirect" in options) { return; }
    
    auto headerTitle = "Docu ID:"~(this.entity ? this.entity.id.toString : " - Unbekannt -");
    auto bodyTitle = "Docu Name:";

    this.form
      .parameter("headerTitle", headerTitle)
      .parameter("bodyTitle", bodyTitle)
      .entity(this.entity);
  }
}
mixin(ViewCalls!("CMSDocusReadView"));

version(test_uim_cms) { unittest {
    // TODO
}}
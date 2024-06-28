module apps.cms.views.tutorials.read;

import apps.cms;
@safe:
import apps.cms.views.tutorials;

class DCMSTutorialsReadView : DCMSReadView {
  mixin(ViewThis!("CMSTutorialsReadView"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    this.rootPath("/cms/tutorials");

    if (auto myHeader = cast(DPageHeaderViewComponent)this.header) {
      myHeader
        .title(titleView("Tutorial anzeigen"))
        .actions([["refresh", "list", "create"]])
        .rootPath(this.rootPath)
        .breadcrumbs
          .items(
            ["/", "UIM"],
            ["/cms", "CMS"],
            [this.rootPath, "Tutorials"],
            ["this.rootPath", "Anzeigen"]
          );
    }

    if (auto myForm = cast(DForm)this.form) {
      myForm
        .crudMode(CRUDModes.Read)
        .content(FormContent.form(myForm));

      if (auto myFormHeader = cast(DFormHeader)myForm.header) {
        myFormHeader
          .mainTitle("Tutorials")
          .subTitle("Tutorials anzeigen");
      }
    }
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSTutorialsReadView~"::DCMSTutorialsReadView:beforeH5");
    super.beforeH5(options);
    if (hasError || "redirect" in options) { return; }

    auto headerTitle = "Tutorial ID:"~(this.entity ? this.entity.id.toString : " - Unbekannt -");
    auto bodyTitle = "Tutorial Name:";

    this.form
      .parameter("headerTitle", headerTitle)
      .parameter("bodyTitle", bodyTitle)
      .entity(this.entity);
  }
}
mixin(ViewCalls!("CMSTutorialsReadView"));

version(test_uim_cms) { unittest {
    // TODO
}}
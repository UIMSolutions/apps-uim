module apps.cms.views.tutorials.update;

import apps.cms;
@safe:
import apps.cms.views.tutorials;

class DCMSTutorialsUpdateView : DCMSUpdateView {
  mixin(ViewThis!("CMSTutorialsUpdateView"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    this
      .rootPath("/cms/tutorials");

    if (auto myHeader = cast(DPageHeaderViewComponent)this.header) {
      myHeader
        .title(titleEdit("Tutorial bearbeiten"))
        .rootPath(this.rootPath)
        .breadcrumbs
          .items(
            ["/cms", "CMS"],
            [this.rootPath, "Tutorials"],
            [" ", "Bearbeiten"]
          );
    }

    if (auto myForm = cast(DForm)this.form) {
      myForm
        .action("/cms/tutorials/actions/update")
        .crudMode(CRUDModes.Update)
        .content(FormContent.form(myForm));

      if (auto myFormHeader = cast(DFormHeader)myForm.header) {
        myFormHeader
          .mainTitle("Tutorials")
          .subTitle("Tutorials bearbeiten");
      }
    }
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSTutorialsUpdateView~"::DCMSTutorialsUpdateView:beforeH5");
    super.beforeH5(options);

    if (this.header) this.header.entity(this.entity);

    auto headerTitle = "Tutorial ID:"~(this.entity ? this.entity.id.toString : " - Unbekannt -");
    auto bodyTitle = "Tutorial Name:";
  }
}
mixin(ViewCalls!("CMSTutorialsUpdateView"));
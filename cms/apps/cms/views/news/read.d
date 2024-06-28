module apps.cms.views.news.read;

import apps.cms;
@safe:

class DCMSNewsReadView : DCMSView {
  mixin(ViewThis!("CMSNewsReadView"));

override void initialize(Json configSettings = Json(null)) {
  super.initialize(configSettings);

  this.rootPath("/cms/newss");

  if (auto myHeader = cast(DPageHeaderViewComponent)this.header) {
    myHeader
      .title(titleView("News anzeigen"))
      .actions([["refresh", "list", "create"]])
      .rootPath(this.rootPath);
  }

  if (auto myForm = cast(DForm)this.form) {
    myForm
      .crudMode(CRUDModes.Read)
      .content(FormContent.form(myForm));

    if (auto myFormHeader = cast(DFormHeader)myForm.header) {
      myFormHeader
        .mainTitle("News")
        .subTitle("News anzeigen");
    }
  }
}

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSNewsReadView~"::DCMSNewsReadView:beforeH5");
    super.beforeH5(options);
    if (hasError || "redirect" in options) { return; }

    auto headerTitle = "News ID:"~(this.entity ? this.entity.id.toString : " - Unbekannt -");
    auto bodyTitle = "News Name:";

    if (auto myHeader = cast(DPageHeaderViewComponent)this.header) {
      myHeader
        .breadcrumbs
          .items(
          ["/", "UIM"],
          ["/cms", "CMS"],
          [this.rootPath, "News"],
          [rootPath~"/view?id="~(this.entity ? this.entity["id"] : " -missing-"), "Anzeigen"]
        );
    }

    this.form
      .parameter("headerTitle", headerTitle)
      .parameter("bodyTitle", bodyTitle)
      .entity(this.entity);

    this
      .pageHeader
        .title("News -> Read")
        .breadcrumbs
          .items(
            ["/", "UIM"],
            [this.rootPath, "CMS"],
            [this.rootPath~"/news", "News"],
            [this.rootPath~"/news/read", "Read"]
          );
  }
}
mixin(ViewCalls!("CMSNewsReadView", "DCMSNewsReadView"));
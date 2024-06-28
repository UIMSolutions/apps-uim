module apps.cms.views.pages.index;

import apps.cms;
@safe:
import apps.cms.views.pages;

class DCMSPagesIndexView : DEntitiesListView {
  mixin(ViewThis!("CMSPagesIndexView"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    this.rootPath("/cms/pages");

    auto myPageHeader = PageHeader(this);
    myPageHeader
      .title(titleView("Übersicht Pages"))
      .actions([["refresh", "list", "create"]])
      .rootPath(this.rootPath)
      .breadcrumbs
        .items(
          ["/cms", "CMS"],
          [this.rootPath, "Pages"]
        );

    auto headerTitle = titleList("Pages");
    auto bodyTitle = "Gefundene Pages";

    auto myForm = EntitiesListForm(this)
      .header(
        FormHeader
          .mainTitle("Pages")
          .subTitle("Pages anzeigen")
          .actions([["print", "export"]]));

    this
      .header(myPageHeader)
      .form(
        myForm
          .content(EntitiesFormContent.form(myForm))
          .rootPath(this.rootPath));
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSPagesIndexView~":DCMSPagesIndexView("~this.name~")::beforeH5");
    super.beforeH5(options);
    if (hasError || "redirect" in options) { return; }

    if (auto myForm = cast(DForm)this.form) {
      myForm
        .header(
          FormHeader
            .rootPath("/pages")
            .mainTitle("Pages")
            .subTitle("Übersicht Pages")
            .actions([["refresh"],["create"]]));
    }
  }

/*   override DH5Obj[] toH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSPagesIndexView~":DCMSPagesIndexView("~this.name~")::toH5");
    super.toH5(options);

    options["rootPath"] = myRootPath;

    this// .rootPath(myRootPath);
    debug writeln("RootPath in DCMSPagesIndexView:toH5 -> ", this.rootPath);
    debug writeln("this.form.rootPath(",this.rootPath,")");

    return [
      H5Div(["content"],
        H5Div(["container-xl"], 
          BS5Row("messages", [""]),
          BS5Row(["row-deck row-cards"], 
          this.form
          .rootPath(this.rootPath)
          .entities(this.entities)
          .toH5(options)
    )))].toH5;              
  }  */
}
mixin(ViewCalls!("CMSPagesIndexView"));

version(test_uim_cms) { unittest {
    // TODO
}}
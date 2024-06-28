module apps.cms.views.links.index;

import apps.cms;
@safe:
import apps.cms.views.links;

class DCMSLinksIndexView : DCMSIndexView {
  mixin(ViewThis!("CMSLinksIndexView"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    this.rootPath("/cms/links");

    auto myPageHeader = PageHeader(this);
    myPageHeader
      .title(titleView("Übersicht Links")) 
      .actions([["refresh", "list", "create"]])
      .rootPath(this.rootPath)
      .breadcrumbs
        .items(
          ["/", "UIM"],
          ["/cms", "CMS"],
          [this.rootPath, "Links"]
        );

    auto headerTitle = titleList("Links");
    auto bodyTitle = "Gefundene Links";

    auto myForm = EntitiesListForm(this)
      .header(
        FormHeader
          .mainTitle("Links")
          .subTitle("Links anzeigen")
          .actions([["print", "export"]]));
    this
      .header(myPageHeader)
      .form(
        myForm
          .content(EntitiesFormContent.form(myForm))
          .rootPath(this.rootPath));
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSLinksIndexView~":DCMSLinksIndexView("~this.name~")::beforeH5");
    super.beforeH5(options);
    if (hasError || "redirect" in options) { return; }

    if (auto myForm = cast(DForm)this.form) {
      myForm.entities(this.entities);
    } 
  }

/*   override DH5Obj[] toH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSLinksIndexView~":DCMSLinksIndexView("~this.name~")::toH5");
    super.toH5(options);

    options["rootPath"] = myRootPath;

    this// .rootPath(myRootPath);
    debug writeln("RootPath in DCMSLinksIndexView:toH5 -> ", this.rootPath);
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
mixin(ViewCalls!("CMSLinksIndexView"));

version(test_uim_cms) { unittest {
    // TODO
}}
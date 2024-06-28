module apps.cms.views.docus.index;

import apps.cms;
@safe:
import apps.cms.views.docus;

class DCMSDocusIndexView : DCMSIndexView {
  mixin(ViewThis!("CMSDocusIndexView"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    this.rootPath("/cms/docus");

    auto myPageHeader = PageHeader(this);
    myPageHeader
      .title(titleView("Übersicht Docus")) 
      .actions([["refresh", "list", "create"]])
      .rootPath(this.rootPath)
      .breadcrumbs
        .items(
          ["/cms", "CMS"],
          [this.rootPath, "Docus"]
        );

    /* auto headerTitle = titleList("Docus"); */
    auto bodyTitle = "Gefundene Docus";

    auto myForm = EntitiesListForm(this)
          .header(
            FormHeader
              .mainTitle("Docus")
              .subTitle("Docus anzeigen")
              .actions([["print", "export"]]));
    this
      .header(myPageHeader)
      .form(
        myForm
          .content(EntitiesFormContent.form(myForm))
          .rootPath(this.rootPath));

/*       .form
        .header(FormHeader// .rootPath(myRootPath)// .mainTitle("Docus")// .subTitle("Docus anzeigen").actions([["print", "export"]]))
        .content(ListFormContent// .rootPath(myRootPath));
        
 */  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSDocusIndexView~":DCMSDocusIndexView("~this.name~")::beforeH5");
    super.beforeH5(options);
    if (hasError || "redirect" in options) { return; }

    if (auto myForm = cast(DForm)this.form) {
      myForm.entities(this.entities);
    } 
  }

/*   override DH5Obj[] toH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSDocusIndexView~":DCMSDocusIndexView("~this.name~")::toH5");
    super.toH5(options);

    options["rootPath"] = myRootPath;

    this// .rootPath(myRootPath);
    debug writeln("RootPath in DCMSDocusIndexView:toH5 -> ", this.rootPath);
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
mixin(ViewCalls!("CMSDocusIndexView"));

version(test_uim_cms) { unittest {
    // TODO
}}
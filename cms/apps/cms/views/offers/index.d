module apps.cms.views.offers.index;

import apps.cms;
@safe:
import apps.cms.views.offers;

class DCMSOffersIndexView : DEntitiesListView {
  mixin(ViewThis!("CMSOffersIndexView"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    this.rootPath("/cms/offers");

    auto headerTitle = titleList("Offers");
    auto bodyTitle = "Gefundene Offers";

    auto myForm = EntitiesListForm(this)
      .header(
        FormHeader
          .mainTitle("Offers")
          .subTitle("Offers anzeigen")
          .actions([["print", "export"]]));

    auto myPageHeader = PageHeader(this);
    myPageHeader
      .title(titleView("Übersicht Offers"))
      .actions([["refresh", "list", "create"]])
      .rootPath(this.rootPath)
      .breadcrumbs
        .items(
          ["/", "UIM"],
          ["/cms", "CMS"],
          [this.rootPath, "Offers"]
        );

    this
      .header(myPageHeader)
      .form(
        myForm
          .content(EntitiesFormContent.form(myForm))
          .rootPath(this.rootPath));
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSOffersIndexView~":DCMSOffersIndexView("~this.name~")::beforeH5");
    super.beforeH5(options);
    if (hasError || "redirect" in options) { return; }

    if (auto myForm = cast(DForm)this.form) {
      myForm.entities(this.entities);
    } 
  }

/*   override DH5Obj[] toH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSOffersIndexView~":DCMSOffersIndexView("~this.name~")::toH5");
    super.toH5(options);

    options["rootPath"] = myRootPath;

    this// .rootPath(myRootPath);
    debug writeln("RootPath in DCMSOffersIndexView:toH5 -> ", this.rootPath);
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
mixin(ViewCalls!("CMSOffersIndexView"));

version(test_uim_cms) { unittest {
    assert(CMSOffersIndexView);
}}
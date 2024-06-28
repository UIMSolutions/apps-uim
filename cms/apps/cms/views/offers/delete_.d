module apps.cms.views.offers.delete_;

import apps.cms;
@safe:

class DCMSOffersDeleteView : DCMSDeleteView {
  mixin(ViewThis!("CMSOffersDeleteView"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    this.rootPath("/cms/offers");

    if (auto myHeader = cast(DPageHeaderViewComponent)this.header) {
      myHeader
        .title(titleDelete("Offer löschen"))
        .rootPath(this.rootPath);
    }
    
     if (auto myForm = cast(DForm)this.form) {
      myForm
        .action(this.rootPath~"/actions/delete")
        .content(FormContent.form(myForm))
        .rootPath(this.rootPath);

      if (auto myFormHeader = cast(DFormHeader)myForm.header) {
        myFormHeader
        .mainTitle("Offers")
        .subTitle("Offers löschen");
      }
    }    
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSOffersDeleteView~"::DCMSOffersDeleteView:beforeH5");
    super.beforeH5(options);

    auto headerTitle = "Offer ID:"~(this.entity ? this.entity.id.toString : " - Unbekannt -");
    auto bodyTitle = "Offer Name:";

    if (auto myHeader = cast(DPageHeaderViewComponent)this.header) {
      myHeader
        .breadcrumbs
          .items(
          ["/", "UIM"],
          ["/cms", "CMS"],
          [rootPath, "Offers"],
          [rootPath~"/delete?id="~(this.entity ? this.entity["id"] : " -missing-"), "Löschen"]
        );
    }
  }
}
mixin(ViewCalls!("CMSOffersDeleteView"));
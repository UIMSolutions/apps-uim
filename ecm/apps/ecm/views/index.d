module apps.ecm.views.index;

import apps.ecm;
@safe:

class DECMIndexView : DView {
  mixin(ViewThis!("ECMIndexView"));

  override DH5Obj[] toH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DECMIndexView~":DECMIndexView("~this.className~")::toH5");
    super.toH5(options);

    return [
      H5Div("APP ECM -> Index")
    ].toH5;
  }
}
mixin(ViewCalls!("ECMIndexView"));

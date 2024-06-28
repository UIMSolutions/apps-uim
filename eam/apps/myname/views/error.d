/*********************************************************************************************************
  Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
  License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
  Authors: Ozan Nurettin Süel (Sicherheitsschmiede)                                                      
**********************************************************************************************************/
module apps.myname.views.error;

import apps.myname;
@safe:

class DMYNAMEErrorView : DView {
  mixin(ViewThis!("MYNAMEErrorView"));

  override void beforeH5(STRINGAA options = null) {
    super.beforeH5(options);
  }

  override DH5Obj[] toH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DMYNAMEErrorView~":DMYNAMEErrorView("~this.name~")::toH5");
    super.toH5(options);

    return [
      H5Div("APP Myname -> Error")
    ].toH5;
  }
}
mixin(ViewCalls!("MYNAMEErrorView"));

function Controller() {
    function doClick(e) {
        alert($.label.text);
    }
    require("alloy/controllers/BaseController").apply(this, Array.prototype.slice.call(arguments));
    $model = arguments[0] ? arguments[0].$model : null;
    var $ = this, exports = {}, __defers = {};
    $.__views.index = Ti.UI.createWindow({
        backgroundColor: "white",
        id: "index"
    });
    $.addTopLevelView($.__views.index);
    $.__views.label = Ti.UI.createButton({
        title: "Start",
        id: "label"
    });
    $.__views.index.add($.__views.label);
    doClick ? $.__views.label.addEventListener("click", doClick) : __defers["$.__views.label!click!doClick"] = !0;
    $.__views.label = Ti.UI.createButton({
        title: "Quit",
        id: "label"
    });
    $.__views.index.add($.__views.label);
    doClick ? $.__views.label.addEventListener("click", doClick) : __defers["$.__views.label!click!doClick"] = !0;
    exports.destroy = function() {};
    _.extend($, $.__views);
    $.index.open();
    __defers["$.__views.label!click!doClick"] && $.__views.label.addEventListener("click", doClick);
    __defers["$.__views.label!click!doClick"] && $.__views.label.addEventListener("click", doClick);
    _.extend($, exports);
}

var Alloy = require("alloy"), Backbone = Alloy.Backbone, _ = Alloy._, $model;

module.exports = Controller;
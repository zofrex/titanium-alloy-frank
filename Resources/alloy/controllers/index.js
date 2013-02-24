function Controller() {
    function startClicked(e) {}
    require("alloy/controllers/BaseController").apply(this, Array.prototype.slice.call(arguments));
    $model = arguments[0] ? arguments[0].$model : null;
    var $ = this, exports = {}, __defers = {};
    $.__views.index = Ti.UI.createWindow({
        backgroundColor: "white",
        layout: "vertical",
        id: "index"
    });
    $.addTopLevelView($.__views.index);
    $.__views.label = Ti.UI.createButton({
        title: "Start",
        id: "label"
    });
    $.__views.index.add($.__views.label);
    startClicked ? $.__views.label.addEventListener("click", startClicked) : __defers["$.__views.label!click!startClicked"] = !0;
    exports.destroy = function() {};
    _.extend($, $.__views);
    $.index.open();
    __defers["$.__views.label!click!startClicked"] && $.__views.label.addEventListener("click", startClicked);
    _.extend($, exports);
}

var Alloy = require("alloy"), Backbone = Alloy.Backbone, _ = Alloy._, $model;

module.exports = Controller;
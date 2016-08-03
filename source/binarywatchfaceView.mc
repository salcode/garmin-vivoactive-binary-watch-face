using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;
using Toybox.System as Sys;
using Toybox.Lang as Lang;

class binarywatchfaceView extends Ui.WatchFace {

    function initialize() {
        WatchFace.initialize();
    }

    // Load your resources here
    function onLayout(dc) {
        setLayout(Rez.Layouts.WatchFace(dc));
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() {
    }

    // Update the view
    function onUpdate(dc) {
        // Get and show the current time
        var clockTime = Sys.getClockTime();
        var timeString = Lang.format("$1$\n$2$", [numberToBinaryStr(clockTime.hour), numberToBinaryStr(clockTime.min)]);
        var view = View.findDrawableById("TimeLabel");
        view.setText(timeString);

        // Call the parent onUpdate function to redraw the layout
        View.onUpdate(dc);
    }

    // Convert number to a string with the binary representation of the string.
    // @param  number num An integer value from 0 to 63.
    // @return string The binary string representation of the number.
    hidden function numberToBinaryStr(num) {
        var positionValue = 32;
        var binaryString = "";

        while (positionValue >= 1) {
            if (num >= positionValue) {
                num = num - positionValue;
                binaryString += "1";
            } else {
                binaryString += "0";
            }
            positionValue = positionValue / 2;
        }

        return binaryString;
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() {
    }

    // The user has just looked at their watch. Timers and animations may be started here.
    function onExitSleep() {
    }

    // Terminate any active timers and prepare for slow updates.
    function onEnterSleep() {
    }

}

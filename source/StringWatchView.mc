using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;
using Toybox.System as Sys;
using Toybox.Lang as Lang;

class StringWatchView extends Ui.WatchFace {

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
        var czechNumbers = [
            "nula", // 0
            "jedna", // 1
            "dvě", // 2
            "tři", // 3
            "čtyři", // 4
            "pět", // 5
            "šest", // 6
            "sedm", // 7
            "osm", // 8
            "devět", // 9
            "deset", // 10
            "jedenáct", // 11
            "dvanáct", // 12
            "třináct", // 13
            "čtrnáct", // 14
            "patnáct", // 15
            "šestnáct", // 16
            "sedmnáct", // 17
            "osmnáct", // 18
            "devatenáct", // 19
            "dvacet", // 20
            "třicet", // 30
            "čtyřicet", // 40
            "padesát" // 50
        ];

        // Get and show the current time
        var clockTime = Sys.getClockTime();

        // var timeString = Lang.format("$1$:$2$", [clockTime.hour, clockTime.min.format("%02d")]);

        var hoursString = czechNumbers[clockTime.hour];
        var hoursView = View.findDrawableById("HoursLabel");
        hoursView.setText(hoursString);

        var minutes = clockTime.min.format("%02d");
        var minutesFirstDigit = minutes.substring(0, 1);
        var minutesSecondDigitStr = minutes.substring(1, 2);
        var minutesSecondDigitNum = minutesSecondDigitStr.toNumber();
        var minutesString;

        switch (minutesFirstDigit) {
            case "0":
                minutesString = czechNumbers[0] + " " + czechNumbers[minutesSecondDigitNum];
                break;
            case "1":
                minutesString = czechNumbers[minutes.toNumber()];
                break;
            case "2":
                minutesString = czechNumbers[20] + " " + czechNumbers[minutesSecondDigitNum];
                break;
            case "3":
                minutesString = czechNumbers[21] + " " + czechNumbers[minutesSecondDigitNum];
                break;
            case "4":
                minutesString = czechNumbers[22] + " " + czechNumbers[minutesSecondDigitNum];
                break;
            case "5":
                minutesString = czechNumbers[23] + " " + czechNumbers[minutesSecondDigitNum];
                break;
            default: minutesString = "?";
        }

        var minutesView = View.findDrawableById("MinutesLabel");
        minutesView.setText(minutesString);

        // Call the parent onUpdate function to redraw the layout
        View.onUpdate(dc);
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

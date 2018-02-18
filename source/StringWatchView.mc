using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;
using Toybox.System as Sys;
using Toybox.Lang as Lang;

class StringWatchView extends Ui.WatchFace {

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
        "dvacet jedna", // 21
        "dvacet dva", // 22
        "dvacet tři", // 23
        // ---
        "třicet", // 30
        "čtyřicet", // 40
        "padesát" // 50
    ];

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

    function getHoursString(hoursNum) {
        return czechNumbers[hoursNum];
    }

    function getMinutesString(minutesStr) {
        var minutesFirstDigit = minutesStr.substring(0, 1);
        var minutesSecondDigitStr = minutesStr.substring(1, 2);
        var minutesSecondDigitNum = minutesSecondDigitStr.toNumber();
        var minutesFinalString;

        switch (minutesFirstDigit) {
            case "0":
                minutesFinalString = czechNumbers[0] + " " + (minutesSecondDigitNum == 2 ? "dva" : czechNumbers[minutesSecondDigitNum]);
                break;
            case "1":
                minutesFinalString = czechNumbers[minutesStr.toNumber()];
                break;
            case "2":
                minutesFinalString = czechNumbers[20]
                    + (minutesSecondDigitNum != 0 ? " "
                    + (minutesSecondDigitNum == 2 ? "dva" : czechNumbers[minutesSecondDigitNum]) : "");
                break;
            case "3":
                minutesFinalString = czechNumbers[24]
                    + (minutesSecondDigitNum != 0 ? " "
                    + (minutesSecondDigitNum == 2 ? "dva" : czechNumbers[minutesSecondDigitNum]) : "");
                break;
            case "4":
                minutesFinalString = czechNumbers[25]
                    + (minutesSecondDigitNum != 0 ? " "
                    + (minutesSecondDigitNum == 2 ? "dva" : czechNumbers[minutesSecondDigitNum]) : "");
                break;
            case "5":
                minutesFinalString = czechNumbers[26]
                    + (minutesSecondDigitNum != 0 ? " "
                    + (minutesSecondDigitNum == 2 ? "dva" : czechNumbers[minutesSecondDigitNum]) : "");
                break;
            default: minutesFinalString = "?";
        }

        return minutesFinalString;
    }

    // Update the view
    function onUpdate(dc) {
        var clockTime = Sys.getClockTime();
        var hoursString = getHoursString(clockTime.hour);
        var minutesString = getMinutesString(clockTime.min.format("%02d"));
        var hoursView = View.findDrawableById("HoursLabel");
        var minutesView = View.findDrawableById("MinutesLabel");

        if (hoursString == "nula" && minutesString == "nula nula") {
            hoursView.setText("půlnoc");
            minutesView.setText("(běž spát)");
        } else {
            hoursView.setText(hoursString);
            minutesView.setText(minutesString);
        }

        // hours tests (should be removed by the compiler when building release code)
        // Test.assertEqualMessage(getHoursString(0), "nula", "00:XX");
        // Test.assertEqualMessage(getHoursString(1), "jedna", "01:XX");
        // Test.assertEqualMessage(getHoursString(2), "dvě", "02:XX");
        // Test.assertEqualMessage(getHoursString(3), "tři", "03:XX");
        // Test.assertEqualMessage(getHoursString(4), "čtyři", "04:XX");
        // Test.assertEqualMessage(getHoursString(5), "pět", "05:XX");
        // Test.assertEqualMessage(getHoursString(6), "šest", "06:XX");
        // Test.assertEqualMessage(getHoursString(7), "sedm", "07:XX");
        // Test.assertEqualMessage(getHoursString(8), "osm", "08:XX");
        // Test.assertEqualMessage(getHoursString(9), "devět", "09:XX");
        // Test.assertEqualMessage(getHoursString(10), "deset", "10:XX");
        // Test.assertEqualMessage(getHoursString(11), "jedenáct", "11:XX");
        // Test.assertEqualMessage(getHoursString(12), "dvanáct", "12:XX");
        // Test.assertEqualMessage(getHoursString(13), "třináct", "13:XX");
        // Test.assertEqualMessage(getHoursString(14), "čtrnáct", "14:XX");
        // Test.assertEqualMessage(getHoursString(15), "patnáct", "15:XX");
        // Test.assertEqualMessage(getHoursString(16), "šestnáct", "16:XX");
        // Test.assertEqualMessage(getHoursString(17), "sedmnáct", "17:XX");
        // Test.assertEqualMessage(getHoursString(18), "osmnáct", "18:XX");
        // Test.assertEqualMessage(getHoursString(19), "devatenáct", "19:XX");
        // Test.assertEqualMessage(getHoursString(20), "dvacet", "20:XX");
        // Test.assertEqualMessage(getHoursString(21), "dvacet jedna", "21:XX");
        // Test.assertEqualMessage(getHoursString(22), "dvacet dva", "22:XX");
        // Test.assertEqualMessage(getHoursString(23), "dvacet tři", "23:XX");

        // minutes tests (should be removed by the compiler when building release code)
        // Test.assertEqualMessage(getMinutesString("00"), "nula nula", "XX:00");
        // Test.assertEqualMessage(getMinutesString("01"), "nula jedna", "XX:01");
        // Test.assertEqualMessage(getMinutesString("02"), "nula dva", "XX:02");
        // Test.assertEqualMessage(getMinutesString("03"), "nula tři", "XX:03");
        // Test.assertEqualMessage(getMinutesString("04"), "nula čtyři", "XX:04");
        // Test.assertEqualMessage(getMinutesString("05"), "nula pět", "XX:05");
        // Test.assertEqualMessage(getMinutesString("06"), "nula šest", "XX:06");
        // Test.assertEqualMessage(getMinutesString("07"), "nula sedm", "XX:07");
        // Test.assertEqualMessage(getMinutesString("08"), "nula osm", "XX:08");
        // Test.assertEqualMessage(getMinutesString("09"), "nula devět", "XX:09");

        // Test.assertEqualMessage(getMinutesString("10"), "deset", "XX:10");
        // Test.assertEqualMessage(getMinutesString("11"), "jedenáct", "XX:11");
        // Test.assertEqualMessage(getMinutesString("12"), "dvanáct", "XX:12");
        // Test.assertEqualMessage(getMinutesString("13"), "třináct", "XX:13");
        // Test.assertEqualMessage(getMinutesString("14"), "čtrnáct", "XX:14");
        // Test.assertEqualMessage(getMinutesString("15"), "patnáct", "XX:15");
        // Test.assertEqualMessage(getMinutesString("16"), "šestnáct", "XX:16");
        // Test.assertEqualMessage(getMinutesString("17"), "sedmnáct", "XX:17");
        // Test.assertEqualMessage(getMinutesString("18"), "osmnáct", "XX:18");
        // Test.assertEqualMessage(getMinutesString("19"), "devatenáct", "XX:19");

        // Test.assertEqualMessage(getMinutesString("20"), "dvacet", "XX:20");
        // Test.assertEqualMessage(getMinutesString("21"), "dvacet jedna", "XX:21");
        // Test.assertEqualMessage(getMinutesString("22"), "dvacet dva", "XX:22");
        // Test.assertEqualMessage(getMinutesString("23"), "dvacet tři", "XX:23");
        // Test.assertEqualMessage(getMinutesString("24"), "dvacet čtyři", "XX:24");
        // Test.assertEqualMessage(getMinutesString("25"), "dvacet pět", "XX:25");
        // Test.assertEqualMessage(getMinutesString("26"), "dvacet šest", "XX:26");
        // Test.assertEqualMessage(getMinutesString("27"), "dvacet sedm", "XX:27");
        // Test.assertEqualMessage(getMinutesString("28"), "dvacet osm", "XX:28");
        // Test.assertEqualMessage(getMinutesString("29"), "dvacet devět", "XX:29");

        // Test.assertEqualMessage(getMinutesString("30"), "třicet", "XX:30");
        // Test.assertEqualMessage(getMinutesString("31"), "třicet jedna", "XX:31");
        // Test.assertEqualMessage(getMinutesString("32"), "třicet dva", "XX:32");
        // Test.assertEqualMessage(getMinutesString("33"), "třicet tři", "XX:33");
        // Test.assertEqualMessage(getMinutesString("34"), "třicet čtyři", "XX:34");
        // Test.assertEqualMessage(getMinutesString("35"), "třicet pět", "XX:35");
        // Test.assertEqualMessage(getMinutesString("36"), "třicet šest", "XX:36");
        // Test.assertEqualMessage(getMinutesString("37"), "třicet sedm", "XX:37");
        // Test.assertEqualMessage(getMinutesString("38"), "třicet osm", "XX:38");
        // Test.assertEqualMessage(getMinutesString("39"), "třicet devět", "XX:39");

        // Test.assertEqualMessage(getMinutesString("40"), "čtyřicet", "XX:40");
        // Test.assertEqualMessage(getMinutesString("41"), "čtyřicet jedna", "XX:41");
        // Test.assertEqualMessage(getMinutesString("42"), "čtyřicet dva", "XX:42");
        // Test.assertEqualMessage(getMinutesString("43"), "čtyřicet tři", "XX:43");
        // Test.assertEqualMessage(getMinutesString("44"), "čtyřicet čtyři", "XX:44");
        // Test.assertEqualMessage(getMinutesString("45"), "čtyřicet pět", "XX:45");
        // Test.assertEqualMessage(getMinutesString("46"), "čtyřicet šest", "XX:46");
        // Test.assertEqualMessage(getMinutesString("47"), "čtyřicet sedm", "XX:47");
        // Test.assertEqualMessage(getMinutesString("48"), "čtyřicet osm", "XX:48");
        // Test.assertEqualMessage(getMinutesString("49"), "čtyřicet devět", "XX:49");

        // Test.assertEqualMessage(getMinutesString("50"), "padesát", "XX:50");
        // Test.assertEqualMessage(getMinutesString("51"), "padesát jedna", "XX:51");
        // Test.assertEqualMessage(getMinutesString("52"), "padesát dva", "XX:52");
        // Test.assertEqualMessage(getMinutesString("53"), "padesát tři", "XX:53");
        // Test.assertEqualMessage(getMinutesString("54"), "padesát čtyři", "XX:54");
        // Test.assertEqualMessage(getMinutesString("55"), "padesát pět", "XX:55");
        // Test.assertEqualMessage(getMinutesString("56"), "padesát šest", "XX:56");
        // Test.assertEqualMessage(getMinutesString("57"), "padesát sedm", "XX:57");
        // Test.assertEqualMessage(getMinutesString("58"), "padesát osm", "XX:58");
        // Test.assertEqualMessage(getMinutesString("59"), "padesát devět", "XX:59");

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

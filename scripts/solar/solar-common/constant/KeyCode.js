/**
 * A specific API for interfacing with the keyboard.
 */
var KeyCode;
(function (KeyCode) {
    KeyCode[KeyCode["VK_ENTER"] = 10] = "VK_ENTER";
    /** Constant for the BACK_SPACE virtual key. */
    KeyCode[KeyCode["VK_BACK_SPACE"] = 8] = "VK_BACK_SPACE";
    /** Constant for the TAB virtual key. */
    KeyCode[KeyCode["VK_TAB"] = 9] = "VK_TAB";
    /** Constant for the CANCEL virtual key. */
    KeyCode[KeyCode["VK_CANCEL"] = 3] = "VK_CANCEL";
    /** Constant for the CLEAR virtual key. */
    KeyCode[KeyCode["VK_CLEAR"] = 12] = "VK_CLEAR";
    /** Constant for the SHIFT virtual key. */
    KeyCode[KeyCode["VK_SHIFT"] = 16] = "VK_SHIFT";
    /** Constant for the CONTROL virtual key. */
    KeyCode[KeyCode["VK_CONTROL"] = 17] = "VK_CONTROL";
    /** Constant for the ALT virtual key. */
    KeyCode[KeyCode["VK_ALT"] = 18] = "VK_ALT";
    /** Constant for the PAUSE virtual key. */
    KeyCode[KeyCode["VK_PAUSE"] = 19] = "VK_PAUSE";
    /** Constant for the CAPS_LOCK virtual key. */
    KeyCode[KeyCode["VK_CAPS_LOCK"] = 20] = "VK_CAPS_LOCK";
    /** Constant for the ESCAPE virtual key. */
    KeyCode[KeyCode["VK_ESCAPE"] = 27] = "VK_ESCAPE";
    /** Constant for the SPACE virtual key. */
    KeyCode[KeyCode["VK_SPACE"] = 32] = "VK_SPACE";
    /** Constant for the PAGE_UP virtual key. */
    KeyCode[KeyCode["VK_PAGE_UP"] = 33] = "VK_PAGE_UP";
    /** Constant for the PAGE_DOWN virtual key. */
    KeyCode[KeyCode["VK_PAGE_DOWN"] = 34] = "VK_PAGE_DOWN";
    /** Constant for the END virtual key. */
    KeyCode[KeyCode["VK_END"] = 35] = "VK_END";
    /** Constant for the HOME virtual key. */
    KeyCode[KeyCode["VK_HOME"] = 36] = "VK_HOME";
    /**
     * Constant for the non-numpad <b>left</b> arrow key.
     * @see #VK_KP_LEFT
     */
    KeyCode[KeyCode["VK_LEFT"] = 37] = "VK_LEFT";
    /**
     * Constant for the non-numpad <b>up</b> arrow key.
     * @see #VK_KP_UP
     */
    KeyCode[KeyCode["VK_UP"] = 38] = "VK_UP";
    /**
     * Constant for the non-numpad <b>right</b> arrow key.
     * @see #VK_KP_RIGHT
     */
    KeyCode[KeyCode["VK_RIGHT"] = 39] = "VK_RIGHT";
    /**
     * Constant for the non-numpad <b>down</b> arrow key.
     * @see #VK_KP_DOWN
     */
    KeyCode[KeyCode["VK_DOWN"] = 40] = "VK_DOWN";
    /**
     * Constant for the comma key, ","
     */
    KeyCode[KeyCode["VK_COMMA"] = 44] = "VK_COMMA";
    /**
     * Constant for the minus key, "-"
     * @since 1.2
     */
    KeyCode[KeyCode["VK_MINUS"] = 45] = "VK_MINUS";
    /**
     * Constant for the period key, "."
     */
    KeyCode[KeyCode["VK_PERIOD"] = 46] = "VK_PERIOD";
    /**
     * Constant for the forward slash key, "/"
     */
    KeyCode[KeyCode["VK_SLASH"] = 47] = "VK_SLASH";
    /** VK_0 thru VK_9 are the same as ASCII '0' thru '9' (0x30 - 0x39) */
    /** Constant for the "0" key. */
    KeyCode[KeyCode["VK_0"] = 48] = "VK_0";
    /** Constant for the "1" key. */
    KeyCode[KeyCode["VK_1"] = 49] = "VK_1";
    /** Constant for the "2" key. */
    KeyCode[KeyCode["VK_2"] = 50] = "VK_2";
    /** Constant for the "3" key. */
    KeyCode[KeyCode["VK_3"] = 51] = "VK_3";
    /** Constant for the "4" key. */
    KeyCode[KeyCode["VK_4"] = 52] = "VK_4";
    /** Constant for the "5" key. */
    KeyCode[KeyCode["VK_5"] = 53] = "VK_5";
    /** Constant for the "6" key. */
    KeyCode[KeyCode["VK_6"] = 54] = "VK_6";
    /** Constant for the "7" key. */
    KeyCode[KeyCode["VK_7"] = 55] = "VK_7";
    /** Constant for the "8" key. */
    KeyCode[KeyCode["VK_8"] = 56] = "VK_8";
    /** Constant for the "9" key. */
    KeyCode[KeyCode["VK_9"] = 57] = "VK_9";
    /**
     * Constant for the semicolon key, ","
     */
    KeyCode[KeyCode["VK_SEMICOLON"] = 59] = "VK_SEMICOLON";
    /**
     * Constant for the equals key, "="
     */
    KeyCode[KeyCode["VK_EQUALS"] = 61] = "VK_EQUALS";
    /** VK_A thru VK_Z are the same as ASCII 'A' thru 'Z' (0x41 - 0x5A) */
    /** Constant for the "A" key. */
    KeyCode[KeyCode["VK_A"] = 65] = "VK_A";
    /** Constant for the "B" key. */
    KeyCode[KeyCode["VK_B"] = 66] = "VK_B";
    /** Constant for the "C" key. */
    KeyCode[KeyCode["VK_C"] = 67] = "VK_C";
    /** Constant for the "D" key. */
    KeyCode[KeyCode["VK_D"] = 68] = "VK_D";
    /** Constant for the "E" key. */
    KeyCode[KeyCode["VK_E"] = 69] = "VK_E";
    /** Constant for the "F" key. */
    KeyCode[KeyCode["VK_F"] = 70] = "VK_F";
    /** Constant for the "G" key. */
    KeyCode[KeyCode["VK_G"] = 71] = "VK_G";
    /** Constant for the "H" key. */
    KeyCode[KeyCode["VK_H"] = 72] = "VK_H";
    /** Constant for the "I" key. */
    KeyCode[KeyCode["VK_I"] = 73] = "VK_I";
    /** Constant for the "J" key. */
    KeyCode[KeyCode["VK_J"] = 74] = "VK_J";
    /** Constant for the "K" key. */
    KeyCode[KeyCode["VK_K"] = 75] = "VK_K";
    /** Constant for the "L" key. */
    KeyCode[KeyCode["VK_L"] = 76] = "VK_L";
    /** Constant for the "M" key. */
    KeyCode[KeyCode["VK_M"] = 77] = "VK_M";
    /** Constant for the "N" key. */
    KeyCode[KeyCode["VK_N"] = 78] = "VK_N";
    /** Constant for the "O" key. */
    KeyCode[KeyCode["VK_O"] = 79] = "VK_O";
    /** Constant for the "P" key. */
    KeyCode[KeyCode["VK_P"] = 80] = "VK_P";
    /** Constant for the "Q" key. */
    KeyCode[KeyCode["VK_Q"] = 81] = "VK_Q";
    /** Constant for the "R" key. */
    KeyCode[KeyCode["VK_R"] = 82] = "VK_R";
    /** Constant for the "S" key. */
    KeyCode[KeyCode["VK_S"] = 83] = "VK_S";
    /** Constant for the "T" key. */
    KeyCode[KeyCode["VK_T"] = 84] = "VK_T";
    /** Constant for the "U" key. */
    KeyCode[KeyCode["VK_U"] = 85] = "VK_U";
    /** Constant for the "V" key. */
    KeyCode[KeyCode["VK_V"] = 86] = "VK_V";
    /** Constant for the "W" key. */
    KeyCode[KeyCode["VK_W"] = 87] = "VK_W";
    /** Constant for the "X" key. */
    KeyCode[KeyCode["VK_X"] = 88] = "VK_X";
    /** Constant for the "Y" key. */
    KeyCode[KeyCode["VK_Y"] = 89] = "VK_Y";
    /** Constant for the "Z" key. */
    KeyCode[KeyCode["VK_Z"] = 90] = "VK_Z";
    /**
     * Constant for the open bracket key, "["
     */
    KeyCode[KeyCode["VK_OPEN_BRACKET"] = 91] = "VK_OPEN_BRACKET";
    /**
     * Constant for the back slash key, "\"
     */
    KeyCode[KeyCode["VK_BACK_SLASH"] = 92] = "VK_BACK_SLASH";
    /**
     * Constant for the close bracket key, "]"
     */
    KeyCode[KeyCode["VK_CLOSE_BRACKET"] = 93] = "VK_CLOSE_BRACKET";
    /** Constant for the number pad "0" key. */
    KeyCode[KeyCode["VK_NUMPAD0"] = 96] = "VK_NUMPAD0";
    /** Constant for the number pad "1" key. */
    KeyCode[KeyCode["VK_NUMPAD1"] = 97] = "VK_NUMPAD1";
    /** Constant for the number pad "2" key. */
    KeyCode[KeyCode["VK_NUMPAD2"] = 98] = "VK_NUMPAD2";
    /** Constant for the number pad "3" key. */
    KeyCode[KeyCode["VK_NUMPAD3"] = 99] = "VK_NUMPAD3";
    /** Constant for the number pad "4" key. */
    KeyCode[KeyCode["VK_NUMPAD4"] = 100] = "VK_NUMPAD4";
    /** Constant for the number pad "5" key. */
    KeyCode[KeyCode["VK_NUMPAD5"] = 101] = "VK_NUMPAD5";
    /** Constant for the number pad "6" key. */
    KeyCode[KeyCode["VK_NUMPAD6"] = 102] = "VK_NUMPAD6";
    /** Constant for the number pad "7" key. */
    KeyCode[KeyCode["VK_NUMPAD7"] = 103] = "VK_NUMPAD7";
    /** Constant for the number pad "8" key. */
    KeyCode[KeyCode["VK_NUMPAD8"] = 104] = "VK_NUMPAD8";
    /** Constant for the number pad "9" key. */
    KeyCode[KeyCode["VK_NUMPAD9"] = 105] = "VK_NUMPAD9";
    /** Constant for the number pad multiply key. */
    KeyCode[KeyCode["VK_MULTIPLY"] = 106] = "VK_MULTIPLY";
    /** Constant for the number pad add key. */
    KeyCode[KeyCode["VK_ADD"] = 107] = "VK_ADD";
    /**
     * This constant is obsolete, and is included only for backwards
     * compatibility.
     * @see #VK_SEPARATOR
     */
    KeyCode[KeyCode["VK_SEPARATER"] = 108] = "VK_SEPARATER";
    /**
     * Constant for the Numpad Separator key.
     * @since 1.4
     */
    KeyCode[KeyCode["VK_SEPARATOR"] = 108] = "VK_SEPARATOR";
    /** Constant for the number pad subtract key. */
    KeyCode[KeyCode["VK_SUBTRACT"] = 109] = "VK_SUBTRACT";
    /** Constant for the number pad decimal point key. */
    KeyCode[KeyCode["VK_DECIMAL"] = 110] = "VK_DECIMAL";
    /** Constant for the number pad divide key. */
    KeyCode[KeyCode["VK_DIVIDE"] = 111] = "VK_DIVIDE";
    /** Constant for the delete key. */
    KeyCode[KeyCode["VK_DELETE"] = 127] = "VK_DELETE";
    /** Constant for the NUM_LOCK key. */
    KeyCode[KeyCode["VK_NUM_LOCK"] = 144] = "VK_NUM_LOCK";
    /** Constant for the SCROLL_LOCK key. */
    KeyCode[KeyCode["VK_SCROLL_LOCK"] = 145] = "VK_SCROLL_LOCK";
    /** Constant for the F1 function key. */
    KeyCode[KeyCode["VK_F1"] = 112] = "VK_F1";
    /** Constant for the F2 function key. */
    KeyCode[KeyCode["VK_F2"] = 113] = "VK_F2";
    /** Constant for the F3 function key. */
    KeyCode[KeyCode["VK_F3"] = 114] = "VK_F3";
    /** Constant for the F4 function key. */
    KeyCode[KeyCode["VK_F4"] = 115] = "VK_F4";
    /** Constant for the F5 function key. */
    KeyCode[KeyCode["VK_F5"] = 116] = "VK_F5";
    /** Constant for the F6 function key. */
    KeyCode[KeyCode["VK_F6"] = 117] = "VK_F6";
    /** Constant for the F7 function key. */
    KeyCode[KeyCode["VK_F7"] = 118] = "VK_F7";
    /** Constant for the F8 function key. */
    KeyCode[KeyCode["VK_F8"] = 119] = "VK_F8";
    /** Constant for the F9 function key. */
    KeyCode[KeyCode["VK_F9"] = 120] = "VK_F9";
    /** Constant for the F10 function key. */
    KeyCode[KeyCode["VK_F10"] = 121] = "VK_F10";
    /** Constant for the F11 function key. */
    KeyCode[KeyCode["VK_F11"] = 122] = "VK_F11";
    /** Constant for the F12 function key. */
    KeyCode[KeyCode["VK_F12"] = 123] = "VK_F12";
    /**
     * Constant for the F13 function key.
     * @since 1.2
     */
    /* F13 - F24 are used on IBM 3270 keyboard, use random range for constants. */
    KeyCode[KeyCode["VK_F13"] = 61440] = "VK_F13";
    /**
     * Constant for the F14 function key.
     * @since 1.2
     */
    KeyCode[KeyCode["VK_F14"] = 61441] = "VK_F14";
    /**
     * Constant for the F15 function key.
     * @since 1.2
     */
    KeyCode[KeyCode["VK_F15"] = 61442] = "VK_F15";
    /**
     * Constant for the F16 function key.
     * @since 1.2
     */
    KeyCode[KeyCode["VK_F16"] = 61443] = "VK_F16";
    /**
     * Constant for the F17 function key.
     * @since 1.2
     */
    KeyCode[KeyCode["VK_F17"] = 61444] = "VK_F17";
    /**
     * Constant for the F18 function key.
     * @since 1.2
     */
    KeyCode[KeyCode["VK_F18"] = 61445] = "VK_F18";
    /**
     * Constant for the F19 function key.
     * @since 1.2
     */
    KeyCode[KeyCode["VK_F19"] = 61446] = "VK_F19";
    /**
     * Constant for the F20 function key.
     * @since 1.2
     */
    KeyCode[KeyCode["VK_F20"] = 61447] = "VK_F20";
    /**
     * Constant for the F21 function key.
     * @since 1.2
     */
    KeyCode[KeyCode["VK_F21"] = 61448] = "VK_F21";
    /**
     * Constant for the F22 function key.
     * @since 1.2
     */
    KeyCode[KeyCode["VK_F22"] = 61449] = "VK_F22";
    /**
     * Constant for the F23 function key.
     * @since 1.2
     */
    KeyCode[KeyCode["VK_F23"] = 61450] = "VK_F23";
    /**
     * Constant for the F24 function key.
     * @since 1.2
     */
    KeyCode[KeyCode["VK_F24"] = 61451] = "VK_F24";
    /**  Constant for the PRINTSCREEN key. */
    KeyCode[KeyCode["VK_PRINTSCREEN"] = 154] = "VK_PRINTSCREEN";
    /**  Constant for the INSERT key. */
    KeyCode[KeyCode["VK_INSERT"] = 155] = "VK_INSERT";
    /**  Constant for the HELP key. */
    KeyCode[KeyCode["VK_HELP"] = 156] = "VK_HELP";
    /**  Constant for the META key. */
    KeyCode[KeyCode["VK_META"] = 157] = "VK_META";
    /**  Constant for the BACK_QUOTE  key. */
    KeyCode[KeyCode["VK_BACK_QUOTE"] = 192] = "VK_BACK_QUOTE";
    /**  Constant for the QUOTE key. */
    KeyCode[KeyCode["VK_QUOTE"] = 222] = "VK_QUOTE";
    /**
     * Constant for the numeric keypad <b>up</b> arrow key.
     * @see #VK_UP
     * @since 1.2
     */
    KeyCode[KeyCode["VK_KP_UP"] = 224] = "VK_KP_UP";
    /**
     * Constant for the numeric keypad <b>down</b> arrow key.
     * @see #VK_DOWN
     * @since 1.2
     */
    KeyCode[KeyCode["VK_KP_DOWN"] = 225] = "VK_KP_DOWN";
    /**
     * Constant for the numeric keypad <b>left</b> arrow key.
     * @see #VK_LEFT
     * @since 1.2
     */
    KeyCode[KeyCode["VK_KP_LEFT"] = 226] = "VK_KP_LEFT";
    /**
     * Constant for the numeric keypad <b>right</b> arrow key.
     * @see #VK_RIGHT
     * @since 1.2
     */
    KeyCode[KeyCode["VK_KP_RIGHT"] = 227] = "VK_KP_RIGHT";
    /* For European keyboards */
    /** @since 1.2 */
    KeyCode[KeyCode["VK_DEAD_GRAVE"] = 128] = "VK_DEAD_GRAVE";
    /** @since 1.2 */
    KeyCode[KeyCode["VK_DEAD_ACUTE"] = 129] = "VK_DEAD_ACUTE";
    /** @since 1.2 */
    KeyCode[KeyCode["VK_DEAD_CIRCUMFLEX"] = 130] = "VK_DEAD_CIRCUMFLEX";
    /** @since 1.2 */
    KeyCode[KeyCode["VK_DEAD_TILDE"] = 131] = "VK_DEAD_TILDE";
    /** @since 1.2 */
    KeyCode[KeyCode["VK_DEAD_MACRON"] = 132] = "VK_DEAD_MACRON";
    /** @since 1.2 */
    KeyCode[KeyCode["VK_DEAD_BREVE"] = 133] = "VK_DEAD_BREVE";
    /** @since 1.2 */
    KeyCode[KeyCode["VK_DEAD_ABOVEDOT"] = 134] = "VK_DEAD_ABOVEDOT";
    /** @since 1.2 */
    KeyCode[KeyCode["VK_DEAD_DIAERESIS"] = 135] = "VK_DEAD_DIAERESIS";
    /** @since 1.2 */
    KeyCode[KeyCode["VK_DEAD_ABOVERING"] = 136] = "VK_DEAD_ABOVERING";
    /** @since 1.2 */
    KeyCode[KeyCode["VK_DEAD_DOUBLEACUTE"] = 137] = "VK_DEAD_DOUBLEACUTE";
    /** @since 1.2 */
    KeyCode[KeyCode["VK_DEAD_CARON"] = 138] = "VK_DEAD_CARON";
    /** @since 1.2 */
    KeyCode[KeyCode["VK_DEAD_CEDILLA"] = 139] = "VK_DEAD_CEDILLA";
    /** @since 1.2 */
    KeyCode[KeyCode["VK_DEAD_OGONEK"] = 140] = "VK_DEAD_OGONEK";
    /** @since 1.2 */
    KeyCode[KeyCode["VK_DEAD_IOTA"] = 141] = "VK_DEAD_IOTA";
    /** @since 1.2 */
    KeyCode[KeyCode["VK_DEAD_VOICED_SOUND"] = 142] = "VK_DEAD_VOICED_SOUND";
    /** @since 1.2 */
    KeyCode[KeyCode["VK_DEAD_SEMIVOICED_SOUND"] = 143] = "VK_DEAD_SEMIVOICED_SOUND";
    /** @since 1.2 */
    KeyCode[KeyCode["VK_AMPERSAND"] = 150] = "VK_AMPERSAND";
    /** @since 1.2 */
    KeyCode[KeyCode["VK_ASTERISK"] = 151] = "VK_ASTERISK";
    /** @since 1.2 */
    KeyCode[KeyCode["VK_QUOTEDBL"] = 152] = "VK_QUOTEDBL";
    /** @since 1.2 */
    KeyCode[KeyCode["VK_LESS"] = 153] = "VK_LESS";
    /** @since 1.2 */
    KeyCode[KeyCode["VK_GREATER"] = 160] = "VK_GREATER";
    /** @since 1.2 */
    KeyCode[KeyCode["VK_BRACELEFT"] = 161] = "VK_BRACELEFT";
    /** @since 1.2 */
    KeyCode[KeyCode["VK_BRACERIGHT"] = 162] = "VK_BRACERIGHT";
    /**
     * Constant for the "@" key.
     * @since 1.2
     */
    KeyCode[KeyCode["VK_AT"] = 512] = "VK_AT";
    /**
     * Constant for the ":" key.
     * @since 1.2
     */
    KeyCode[KeyCode["VK_COLON"] = 513] = "VK_COLON";
    /**
     * Constant for the "^" key.
     * @since 1.2
     */
    KeyCode[KeyCode["VK_CIRCUMFLEX"] = 514] = "VK_CIRCUMFLEX";
    /**
     * Constant for the "$" key.
     * @since 1.2
     */
    KeyCode[KeyCode["VK_DOLLAR"] = 515] = "VK_DOLLAR";
    /**
     * Constant for the Euro currency sign key.
     * @since 1.2
     */
    KeyCode[KeyCode["VK_EURO_SIGN"] = 516] = "VK_EURO_SIGN";
    /**
     * Constant for the "!" key.
     * @since 1.2
     */
    KeyCode[KeyCode["VK_EXCLAMATION_MARK"] = 517] = "VK_EXCLAMATION_MARK";
    /**
     * Constant for the inverted exclamation mark key.
     * @since 1.2
     */
    KeyCode[KeyCode["VK_INVERTED_EXCLAMATION_MARK"] = 518] = "VK_INVERTED_EXCLAMATION_MARK";
    /**
     * Constant for the "(" key.
     * @since 1.2
     */
    KeyCode[KeyCode["VK_LEFT_PARENTHESIS"] = 519] = "VK_LEFT_PARENTHESIS";
    /**
     * Constant for the "#" key.
     * @since 1.2
     */
    KeyCode[KeyCode["VK_NUMBER_SIGN"] = 520] = "VK_NUMBER_SIGN";
    /**
     * Constant for the "+" key.
     * @since 1.2
     */
    KeyCode[KeyCode["VK_PLUS"] = 521] = "VK_PLUS";
    /**
     * Constant for the ")" key.
     * @since 1.2
     */
    KeyCode[KeyCode["VK_RIGHT_PARENTHESIS"] = 522] = "VK_RIGHT_PARENTHESIS";
    /**
     * Constant for the "_" key.
     * @since 1.2
     */
    KeyCode[KeyCode["VK_UNDERSCORE"] = 523] = "VK_UNDERSCORE";
    /**
     * Constant for the Microsoft Windows "Windows" key.
     * It is used for both the left and right version of the key.
     * @see #getKeyLocation()
     * @since 1.5
     */
    KeyCode[KeyCode["VK_WINDOWS"] = 524] = "VK_WINDOWS";
    /**
     * Constant for the Microsoft Windows Context Menu key.
     * @since 1.5
     */
    KeyCode[KeyCode["VK_CONTEXT_MENU"] = 525] = "VK_CONTEXT_MENU";
    /* for input method support on Asian Keyboards */
    /* not clear what this means - listed in Microsoft Windows API */
    /** Constant for the FINAL key. */
    KeyCode[KeyCode["VK_FINAL"] = 24] = "VK_FINAL";
    /** Constant for the Convert function key. */
    /* Japanese PC 106 keyboard, Japanese Solaris keyboard: henkan */
    KeyCode[KeyCode["VK_CONVERT"] = 28] = "VK_CONVERT";
    /** Constant for the Don't Convert function key. */
    /* Japanese PC 106 keyboard: muhenkan */
    KeyCode[KeyCode["VK_NONCONVERT"] = 29] = "VK_NONCONVERT";
    /** Constant for the Accept or Commit function key. */
    /* Japanese Solaris keyboard: kakutei */
    KeyCode[KeyCode["VK_ACCEPT"] = 30] = "VK_ACCEPT";
    /* not clear what this means - listed in Microsoft Windows API */
    /** Constant for the MODECHANGE key. */
    KeyCode[KeyCode["VK_MODECHANGE"] = 31] = "VK_MODECHANGE";
    /* replaced by VK_KANA_LOCK for Microsoft Windows and Solaris,
       might still be used on other platforms */
    /**
     * Constant for the KANA lock key.
     * @see #VK_KANA_LOCK
     **/
    KeyCode[KeyCode["VK_KANA"] = 21] = "VK_KANA";
    /* replaced by VK_INPUT_METHOD_ON_OFF for Microsoft Windows and Solaris,
       might still be used for other platforms */
    /**
     * Constant for KANJI.
     * @see #VK_INPUT_METHOD_ON_OFF
     */
    KeyCode[KeyCode["VK_KANJI"] = 25] = "VK_KANJI";
    /**
     * Constant for the Alphanumeric function key.
     * @since 1.2
     */
    /* Japanese PC 106 keyboard: eisuu */
    KeyCode[KeyCode["VK_ALPHANUMERIC"] = 240] = "VK_ALPHANUMERIC";
    /**
     * Constant for the Katakana function key.
     * @since 1.2
     */
    /* Japanese PC 106 keyboard: katakana */
    KeyCode[KeyCode["VK_KATAKANA"] = 241] = "VK_KATAKANA";
    /**
     * Constant for the Hiragana function key.
     * @since 1.2
     */
    /* Japanese PC 106 keyboard: hiragana */
    KeyCode[KeyCode["VK_HIRAGANA"] = 242] = "VK_HIRAGANA";
    /**
     * Constant for the Full-Width Characters function key.
     * @since 1.2
     */
    /* Japanese PC 106 keyboard: zenkaku */
    KeyCode[KeyCode["VK_FULL_WIDTH"] = 243] = "VK_FULL_WIDTH";
    /**
     * Constant for the Half-Width Characters function key.
     * @since 1.2
     */
    /* Japanese PC 106 keyboard: hankaku */
    KeyCode[KeyCode["VK_HALF_WIDTH"] = 244] = "VK_HALF_WIDTH";
    /**
     * Constant for the Roman Characters function key.
     * @since 1.2
     */
    /* Japanese PC 106 keyboard: roumaji */
    KeyCode[KeyCode["VK_ROMAN_CHARACTERS"] = 245] = "VK_ROMAN_CHARACTERS";
    /**
     * Constant for the All Candidates function key.
     * @since 1.2
     */
    /* Japanese PC 106 keyboard - VK_CONVERT + ALT: zenkouho */
    KeyCode[KeyCode["VK_ALL_CANDIDATES"] = 256] = "VK_ALL_CANDIDATES";
    /**
     * Constant for the Previous Candidate function key.
     * @since 1.2
     */
    /* Japanese PC 106 keyboard - VK_CONVERT + SHIFT: maekouho */
    KeyCode[KeyCode["VK_PREVIOUS_CANDIDATE"] = 257] = "VK_PREVIOUS_CANDIDATE";
    /**
     * Constant for the Code Input function key.
     * @since 1.2
     */
    /* Japanese PC 106 keyboard - VK_ALPHANUMERIC + ALT: kanji bangou */
    KeyCode[KeyCode["VK_CODE_INPUT"] = 258] = "VK_CODE_INPUT";
    /**
     * Constant for the Japanese-Katakana function key.
     * This key switches to a Japanese input method and selects its Katakana input mode.
     * @since 1.2
     */
    /* Japanese Macintosh keyboard - VK_JAPANESE_HIRAGANA + SHIFT */
    KeyCode[KeyCode["VK_JAPANESE_KATAKANA"] = 259] = "VK_JAPANESE_KATAKANA";
    /**
     * Constant for the Japanese-Hiragana function key.
     * This key switches to a Japanese input method and selects its Hiragana input mode.
     * @since 1.2
     */
    /* Japanese Macintosh keyboard */
    KeyCode[KeyCode["VK_JAPANESE_HIRAGANA"] = 260] = "VK_JAPANESE_HIRAGANA";
    /**
     * Constant for the Japanese-Roman function key.
     * This key switches to a Japanese input method and selects its Roman-Direct input mode.
     * @since 1.2
     */
    /* Japanese Macintosh keyboard */
    KeyCode[KeyCode["VK_JAPANESE_ROMAN"] = 261] = "VK_JAPANESE_ROMAN";
    /**
     * Constant for the locking Kana function key.
     * This key locks the keyboard into a Kana layout.
     * @since 1.3
     */
    /* Japanese PC 106 keyboard with special Windows driver - eisuu + Control, Japanese Solaris keyboard: kana */
    KeyCode[KeyCode["VK_KANA_LOCK"] = 262] = "VK_KANA_LOCK";
    /**
     * Constant for the input method on/off key.
     * @since 1.3
     */
    /* Japanese PC 106 keyboard: kanji. Japanese Solaris keyboard: nihongo */
    KeyCode[KeyCode["VK_INPUT_METHOD_ON_OFF"] = 263] = "VK_INPUT_METHOD_ON_OFF";
    /* for Sun keyboards */
    /** @since 1.2 */
    KeyCode[KeyCode["VK_CUT"] = 65489] = "VK_CUT";
    /** @since 1.2 */
    KeyCode[KeyCode["VK_COPY"] = 65485] = "VK_COPY";
    /** @since 1.2 */
    KeyCode[KeyCode["VK_PASTE"] = 65487] = "VK_PASTE";
    /** @since 1.2 */
    KeyCode[KeyCode["VK_UNDO"] = 65483] = "VK_UNDO";
    /** @since 1.2 */
    KeyCode[KeyCode["VK_AGAIN"] = 65481] = "VK_AGAIN";
    /** @since 1.2 */
    KeyCode[KeyCode["VK_FIND"] = 65488] = "VK_FIND";
    /** @since 1.2 */
    KeyCode[KeyCode["VK_PROPS"] = 65482] = "VK_PROPS";
    /** @since 1.2 */
    KeyCode[KeyCode["VK_STOP"] = 65480] = "VK_STOP";
    /**
     * Constant for the Compose function key.
     * @since 1.2
     */
    KeyCode[KeyCode["VK_COMPOSE"] = 65312] = "VK_COMPOSE";
    /**
     * Constant for the AltGraph function key.
     * @since 1.2
     */
    KeyCode[KeyCode["VK_ALT_GRAPH"] = 65406] = "VK_ALT_GRAPH";
    /**
     * Constant for the Begin key.
     * @since 1.5
     */
    KeyCode[KeyCode["VK_BEGIN"] = 65368] = "VK_BEGIN";
})(KeyCode || (KeyCode = {}));
export default KeyCode;
